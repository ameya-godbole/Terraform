variable "AWS_REGION" {
    default = "us-east-2" 
}

variable "AMIS" {
    type = map
    default = {
        us-east-2 = "ami-09b18720cb71042df"
        us-east-2 = "ami-09b18720cb71042df"
        ap-south-1 = "ami-09b18720cb71042df"
    }
}

variable "PVT_KEY_PATH" {
    default = "pvtkey" 
}


variable "PUB_KEY_PATH" {
    default = "pvtkey" 
}


variable "USERNAME" {
    default = "ubuntu" 
}

variable "MYIP" {
    default = "100.100.100.1" 
}

variable "RMQUSER" {
    default = "rabbit" 
}

variable "RMQPASS" {
    default = "abc@abc" 
}

variable "INSTANCE_COUNT" {
    default = "1" 
}

variable "VPC_NAME" {
    default = "abc" 
}

variable "Zone1" {
    default = "us-east-2a" 
}

variable "Zone2" {
    default = "us-east-2b" 
}

variable "Zone3" {
    default = "us-east-2c" 
}

variable "VpcCIDR" {
    default = "172.21.0.0/16" 
}

variable "PubSub1CIDR" {
    default = "172.21.1.0/24" 
}

variable "PubSub2CIDR" {
    default = "172.21.2.0/24" 
}

variable "PubSub3CIDR" {
    default = "172.21.3.0/24" 
}

variable "PvtSub4CIDR" {
    default = "172.21.4.0/24" 
}
variable "PvtSub5CIDR" {
    default = "172.21.5.0/24" 
}

variable "PvtSub6CIDR" {
    default = "172.21.6.0/24" 
}