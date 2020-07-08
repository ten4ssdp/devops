variable "ssh_public_key" {
  type        = string
  default     = "~/.ssh/hetic_rsa.pub"
  # value       = "path/to"
  description = "Path to the SSH public key"
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
