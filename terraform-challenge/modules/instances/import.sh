#!/bin/bash
project=qwiklabs-gcp-04-60f149112d5b
zone=us-east1-c
name1=tf-instance-1
name2=tf-instance-2

terraform import module.instances.google_compute_instance.${name1} projects/${project}/zones/${zone}/instances/${name1}
terraform import module.instances.google_compute_instance.${name2} projects/${project}/zones/${zone}/instances/${name2}
