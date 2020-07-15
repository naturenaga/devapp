variable "sia_name" {
    description = "The name of first docker conatiner image."
    
}


variable "sia_cat" {
    description = "The name of first docker conatiner image."
    
}
variable "ecr_url" {
    description = "The name of first docker conatiner image."
    
}

variable "container_target_group_arn" {
    description = "The name of backend container target group arn."
 }

variable "container_host_port" {
    description = "The name of backend container host port."
    
}

variable "container_port" {
    description = "backend container port."
    
}

variable "container_cpu_limit" {
    description = "The name of backend container cpu limit."
    
}

variable "conatiner_memory_limit" {
    description = "The name of backend conatiner memory limit."
    
}

variable "imageversion" {
    description = "The version of the ECR image."
}


variable "DB_URL" {
    description = "Database jdbc url"
    
}

variable "DB_USER" {
    description = "DB User name"
    
}

variable "DB_PWD" {
    description = "database password"
    
}

