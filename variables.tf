variable "role_name" {
  type        = string
  description = "Name of the IAM role to create. Defaults to runbop-assume-instance."
  default     = "runbop-assume-instance"
}

variable "runbop_account" {
  type        = string
  description = "The external ID value for cross-account trust."
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the IAM role."
  default     = {}
}

variable "subnets" {
  description = "List of subnet ARNs"
  type        = list(string)
  default     = ["arn:aws:ec2:*:<account_id>:subnet/*"]
}

variable "network_interfaces" {
  description = "List of network interface ARNs"
  type        = list(string)
  default     = ["arn:aws:ec2:*:<account_id>:network-interface/*"]
}

variable "volumes" {
  description = "List of volume ARNs"
  type        = list(string)
  default     = ["arn:aws:ec2:*:<account_id>:volume/*"]
}

variable "key_pairs" {
  description = "List of key pair ARNs"
  type        = list(string)
  default     = ["arn:aws:ec2:*:<account_id>:key-pair/*"]
}

variable "security_groups" {
  description = "List of security group ARNs"
  type        = list(string)
  default     = ["arn:aws:ec2:*:<account_id>:security-group/*"]
}