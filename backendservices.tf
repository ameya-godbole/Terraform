resource "aws_db_subnet_group" "rds_subgrp" {
    name = "main"
    subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
    tags = {
        Name = "Subnet group for RDS"
    }
}

resource "aws_elasticache_subnet_group" "ecache_subgroup" {
    name = "ecache_subgroup"
    subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
       tags = {
        Name = "Subnet group for elastic cache"
    }
}

resource "aws_db_instance" "rds" {
    allocated_storage    = 10
    db_name              = var.dbname
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    username             = var.dbuser
    password             = var.dbpass 
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot  = true
    db_subnet_group_name = aws_db_subnet_group.rds_subgrp.name
    vpc_security_group_ids = [aws_security_group.backend_sg.id]
}

resource "aws_elasticache_cluster" "cache" {
  cluster_id           = "cache"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 11211
  security_group_ids = [aws_security_group.backend_sg.id]
  subnet_group_name = aws_elasticache_subnet_group.ecache_subgroup.name
}

resource "aws_mq_broker" "rmq" {
  broker_name = "rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.9"
  host_instance_type = "mq.t2.micro"
  security_groups = [aws_security_group.backend-sg.id]
  subnet_ids = [module.vpc.private_subnets[0]]

  user {
    username = var.RMQUSER
    password = var.RMQPASS
  }
}
