# docker-simple-springboot
Docker binary deployment for Springboot with hot swapping.

## Instructions

0. You need a SpringBoot application, you can use http://github.com/dcortesf/simple-springboot-hot-swapping for test purposes.

1. Deploy the template in OpenShift: **oc create -f dcortes-springboot-hot-swapping.yml**
   If you haven't permission in openshift project, you must update the template code in order to adapt it for your project.

2. Deploy your artifact using the template.

3. From classes directory of your local app: **oc rsync . your-pod:/tmp/git/target/classes**

Enjoy it ;)
