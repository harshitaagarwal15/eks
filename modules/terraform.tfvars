#VPC
vpc_name         = "k8-demo"
instance_tenancy = "default"
cidr             = "10.0.0.0/16"
nat_tag          = "k8s-demo"

#SUBNETS
public_subnet      = "10.0.1.0/24"
availability_zone1 = "us-west-2a"
public_subnet_name = "public_1"

#subnet2

private_subnet      = "10.0.2.0/24"
availability_zone2  = "us-west-2b"
private_subnet_name = "private_1"
private1_subnet     = "10.0.3.0/24"
public_subnet_1     = "10.0.4.0/24"

#internet gateway

igw_name = "internetgateway"

#clustername
cluster_name = "eks-demo"

#nodegroup/Workers

node_group_name = "demo-node-1"
desired_size    = "1"
max_size        = "2"
min_size        = "1"

#noderole

node_role = "node_demo_role-1"
#clusterrole
cluster_role_name = "cluster_demo_role-1"

instance_types = ["m5.large"]
capacity_type  = "SPOT"
ami_type       = "AL2_x86_64"
