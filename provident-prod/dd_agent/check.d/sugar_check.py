from checks import AgentCheck
import os

class HelloCheck(AgentCheck):
  
    def count_apache_conf_files():
        apache_dir = '/etc/apache2'
        sites_available_dir = os.path.join(apache_dir, 'sites-available')
        sites_enabled_dir = os.path.join(apache_dir, 'sites-enabled')

        # Count .conf files in sites-available folder
        sites_available_count = sum(1 for file in os.listdir(sites_available_dir) if file.endswith('.conf'))

        # Count .conf files in sites-enabled folder
        sites_enabled_count = sum(1 for file in os.listdir(sites_enabled_dir) if file.endswith('.conf'))

        return {'sites_available': sites_available_count, 'sites_enabled': sites_enabled_count}


    def check(self, instance):

        sites = self.count_apache_conf_files()

        for metric in instance:
            if metric.type == "available":
                self.gauge('customers.available', sites['sites_available'])
            if metric.type == "enabled":
                self.gauge('customers.enabled', sites['sites_enabled'])

        