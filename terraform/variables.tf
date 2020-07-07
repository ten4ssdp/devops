variable "ssh_public_key" {
  type        = string
  default     = "~/.ssh/hetic_rsa.pub"
  # value       = "path/to"
  description = "Path to the SSH public key"
}