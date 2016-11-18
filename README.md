# Aerobatic docker

A collection of Dockerfiles used by Aerobatic for front-end and back-end CI builds.


### Cheatsheet

~~~sh
# SSH into the EC2
ssh -i ~/.ssh/xxx.pem ec2-user@ec2-xx-xxx-xxx.us-west-2.compute.amazonaws.com

# Upload all the necessary files to the EC2
scp -i ~/.ssh/xxx.pem -r [!.]*  ec2-user@ec2-xx-xxx-xxx-xx.us-west-2.compute.amazonaws.com:docker/)
~~~
