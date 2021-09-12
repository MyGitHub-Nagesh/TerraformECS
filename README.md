# ECS Service with hello world


1. Version.tf
Terraform provider need to be defined , in this cases its AWS 
Terraform provider will require credentials to access your account programmatically,
so generate them according to these https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys



2. main.tf

 - Added data block for aws availability zones, that will Collect all availablity zones  that are available for my account (two availability zones) .
 So that Fargate will ensure high availability by spreading tasks of the same type as evenly as possible between availability zones

 - added vpc resource so Resources that will be created will be defined inside of the VPC
 - 4 subnet will be created, 2 public subnet and 2 private subnet .where each availability zone will have one of each.
 - added internet gateway resource so that it allow communicate between vpc and internet
 - added NAT gateway resource so that it will allow resources to communicae within  vpc but will prevent communication to the VPC from outside sources
 - LB's security group 	will only allow traffic on port 80 , whereas traffic from LB will be allowed to anywhere.
 - added LB to each public subnet in each AZ with LB security group
 - added target group which tells the LB to forward incomng traffic on port 80 to ECS .
 - task definiation is defined  to use fargate with CPU and memory value set. The image used is a simple API that returns "Hello World!" and is available as a public Docker image. 
 - the Docker container exposes the API on port 3000, so same specified as the host and container ports
 - network mode is set to "awsvpc", which tells AWS that an elastic network interface and a private IP address should be assigned to the task when it runs
 - security group for ecs service is created , which tells that ecs should be added to default vpc and allow trafic over tcp to port 3000
 - added ECS service and cluster blocks , ECS service specifies how many tasks of the application should be run with the task_definition and desired_count properties within the cluster
 - the service shouldn't be created until the load balancer has been created, so the load balancer listener is included in the depends_on array.
 
3. Output.tf
   In order to know the URL of load balancer, we have added output so that it shows the url at end of terraform execution.

 
 
