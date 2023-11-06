from checks import AgentCheck
import subprocess

class HelloCheck(AgentCheck):

  def check_efs_mount(efs_id):
    # Run the 'mount' command and capture the output
    try:
        result = subprocess.run(['df', '-hT'], stdout=subprocess.PIPE, universal_newlines=True)
        df_output = result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error running 'df' command: {e}")
        return []

    efs_mount_point = f'{efs_id}.efs.amazonaws.com'
    is_mounted = any(efs_mount_point in line for line in df_output.split('\n'))

    return [(efs_mount_point, is_mounted)]

  def check(self, instance):
    efs_id = instance.efs_id
    mount_list = self.check_efs_mount(efs_id)
    self.gauge('efs.mounted', 1)