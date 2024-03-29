# jenkins-node-jnlp

Setup the host as a Jenkins JNLP node, add the node's configuration to the master, 
configure the jenkins user to autologin and start the connection to the master,
and then reboot if needed so the connection is initiated.

This is NOT the preferred method of connecting to the Jenkins master as the master has no recourse for
reconnecting. The connection is initiated on the node. This role though, will setup an automatic login of the
jenkins user. Upon login, the GUI will be immediately locked and the JNLP agent will be started. 
This will give Jenkins jobs the ability to interact with the desktop.

This type of connection is necessary though if the jobs on this Jenkins node require a GUI to run, 
like UI testing or something else that interacts with the desktop.
SSH connections do not provide use of the desktop unfortunately.

For information about PTA and how to use it with this Ansible role please visit https://github.com/Forcepoint/fp-pta-overview/blob/master/README.md

## Requirements

The Jenkins master already exists and basic setup is complete, and that the GNOME desktop environment is installed.

## Role Variables

### REQUIRED
* jenkins_node_master_url: The URL to the Jenkins master this node will connect with.
* jenkins_node_master_user: A user on the Jenkins master that has enough permissions to add a node.
* jenkins_node_master_password: The password for the user on the Jenkins master. This should be vaulted.
* jenkins_node_user_password: The password for the 'jenkins' user to be created on the node.

Make sure you get those passwords vaulted so they're not in plain text!

### OPTIONAL
* jenkins_node_name: The name for the node. This defaults to the ansible host name.
* jenkins_node_description: The description for the node. The default is blank.
* jenkins_node_executors: The number of executors for the node. This defaults to 1.
* jenkins_node_labels: The labels to apply for the node. Multiple labels should be separated by a space. 
  This defaults to the ansible host name.
* jenkins_node_host: The DNS/IP address for the node. This defaults to the ansible host's default IPV4 address.
* jenkins_node_master_ca_cert: The path to the CA certificate for verifying SSL connections with the master, if needed.
* jenkins_node_user: The user name for connecting to this Jenkins instance.
* jenkins_node_openjdk_major_version: The major version of OpenJDK to install. This defaults to the same major version
  that the jenkins master role uses.
* jenkins_node_openjdk_full_version: The full version of OpenJDK to install. Defaults to "latest" but you can provide a
  specific version if you like. EX: "11.0.6.10"

## Dependencies

None

## Example Playbook

Again, make sure you get those passwords vaulted so they're not in plain text!

      hosts: docker01
      vars:
        jenkins_node_master_address: http://jenkins.COMPANY.com
        jenkins_node_master_user: admin
        jenkins_node_master_password: Password1
        jenkins_node_user_password: Password2
      roles:
        - role: jenkins-node-jnlp

## License

BSD-3-Clause

## Author Information

Jeremy Cornett <jeremy.cornett@forcepoint.com>
