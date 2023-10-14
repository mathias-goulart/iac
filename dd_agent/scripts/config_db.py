import argparse
import mysql.connector
import random
import string
import boto3

# Function to generate a random password
def generate_random_password(length=16, max_retries=3):
    retries = 0

    while retries < max_retries:
        try:
            characters = string.ascii_letters + string.digits + string.punctuation
            password = ''.join(random.choice(characters) for _ in range(length))
            return password
        except Exception as e:
            print(f"Failed to generate a random password: {str(e)}")
            retries += 1

    raise Exception("Failed to generate a random password after retries.")

# Function to check if performance_schema is enabled
def check_performance_schema_enabled(connection):
    # Check if the 'performance_schema' database exists
    cursor = connection.cursor()
    cursor.execute("SHOW DATABASES LIKE 'performance_schema';")
    result = cursor.fetchone()
    cursor.close()
    return result is not None

# Function to create MySQL user and grant privileges
def create_mysql_user_and_grant_privileges(connection, random_password):
    cursor = connection.cursor()

    # SQL statements to create a user and grant privileges
    create_user_sql = f"CREATE USER 'datadog'@'%' IDENTIFIED BY '{random_password}';"
    grant_replication_client_sql = "GRANT REPLICATION CLIENT ON *.* TO 'datadog'@'%';"
    grant_select_performance_schema_sql = "GRANT SELECT ON performance_schema.* TO 'datadog'@'%';"
    grant_privileges_sql = "GRANT REPLICATION CLIENT ON *.* TO 'datadog'@'%' WITH MAX_USER_CONNECTIONS 5;"
    alter_user_sql = "ALTER USER 'datadog'@'%' WITH MAX_USER_CONNECTIONS 5;"
    grant_process_sql = "GRANT PROCESS ON *.* TO 'datadog'@'%';"

    try:
        # Execute the SQL statements
        cursor.execute(create_user_sql)
        cursor.execute(grant_replication_client_sql)
        cursor.execute(grant_select_performance_schema_sql)
        cursor.execute(grant_privileges_sql)
        cursor.execute(alter_user_sql)
        cursor.execute(grant_process_sql)

        # Commit the transaction
        connection.commit()
        print("User 'datadog'@'%' created and privileges granted successfully.")

    except mysql.connector.Error as error:
        print("Error: {}".format(error))

    cursor.close()

# Function to store password in AWS Secrets Manager
def store_password_in_secrets_manager(password, secret_name):
    client = boto3.client('secretsmanager')

    try:
        response = client.create_secret(
            Name=secret_name,
            SecretString=password
        )

        print("Password stored in AWS Secrets Manager with secret name:", secret_name)

    except client.exceptions.ResourceExistsException:
        print("Secret with the specified name already exists. Skipping storage.")

    except Exception as e:
        print("An error occurred while storing the password in AWS Secrets Manager:", str(e))

# Main function
def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Create MySQL user and grant privileges')
    parser.add_argument('--host', type=str, help='MySQL host')
    parser.add_argument('--username', type=str, default='root', help='MySQL username (default: root)')
    parser.add_argument('--store_password', action='store_true', default=False, help='Store password in AWS Secrets Manager')
    parser.add_argument('--secret_name', type=str, default='datadog_mysql_password', help='Name of the AWS Secret')
    parser.add_argument('--password', type=str, help='MySQL password')
    parser.add_argument('--database', type=str, help='Database name')
    args = parser.parse_args()

    # MySQL connection parameters
    host = args.host if args.host else 'localhost'
    username = args.username
    password = args.password

    try:
        # Establish MySQL connection
        connection = mysql.connector.connect(
            host=host,
            user=username,
            password=password
        )

        if connection.is_connected():
            # Check if performance_schema is enabled
            performance_schema_enabled = check_performance_schema_enabled(connection)

            if performance_schema_enabled:
                print("MySQL performance_schema is enabled.")
            else:
                print("MySQL performance_schema is not enabled.")

            # Generate a random password if not provided
            random_password = generate_random_password()

            # Create MySQL user and grant privileges
            create_mysql_user_and_grant_privileges(connection, random_password)

            # Store the password in AWS Secrets Manager if requested
            if args.store_password:
                secret_name = args.secret_name
                store_password_in_secrets_manager(random_password, secret_name)
            else:
                print("Randomly generated password for 'datadog' user:", random_password)

    except mysql.connector.Error as error:
        print("Error: {}".format(error))
    finally:
        if connection.is_connected():
            connection.close()

if __name__ == "__main__":
    main()
