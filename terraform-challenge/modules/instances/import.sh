#!/bin/bash
project=
zone=
name1=
name2

terraform import module.instances.google_compute_instance.${name1} projects/${project}/zones/${zone}/instances/${name1}
terraform import module.instances.google_compute_instance.${name2} projects/${project}/zones/${zone}/instances/${name2}
