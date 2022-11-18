variable "AWS_REGION" {
    default = "us-east-2" 
}

variable "AMIS" {
    type = map
    default = {
        us-east-2 = "ami-09b18720cb71042df"
        us-east-2 = "ami-09b18720cb71042df"
        ap-south-1 = "ami-09b18720cb71042df"]
    }
  
}

