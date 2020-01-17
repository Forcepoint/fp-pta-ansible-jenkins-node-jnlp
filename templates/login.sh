#!/bin/bash
xdg-screensaver lock
java -jar {{ jenkins_node_path }}/agent.jar -jnlpUrl {{ jenkins_node_master_url }}/computer/{{ jenkins_node_name }}/slave-agent.jnlp -secret {{ jenkins_node_secret }} -workDir "{{ jenkins_node_path }}"  &>> {{ jenkins_node_path }}/log.txt