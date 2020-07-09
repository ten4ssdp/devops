
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type"
}

variable "instance_ami" {
  type        = string
  description = "AMI to use for instances"
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to deploy"
}

variable "instance_key_name" {
  type        = string
  description = "AWS EC2 Key name to use for instances"
}

variable "stage" {
  type        = string
  default     = "production"
  description = "Stage in which application is deployed"
}

variable "dbusername" {
  type        = string
  default     = "root"
  description = "Database username"
}

variable "dbpassword" {
  type        = string
  default     = "dumbpwdlolmdrlol"
  description = "Database password"
}

variable "db_allocated_storage" {
  type        = number
  default     = 100
  description = "db allocated storage"
}

variable "db_instance_class" {
  type        = string
  default     = "db.t2.micro"
  description = "db instance class"
}
variable "db_name" {
  type        = string
  default     = "ten4ssdp"
  description = "db name"
}