variable "name" {
  description = "Name prefix"
  type        = string
  default     = "demo"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "git_repository_url" {
  description = "Git repo URL for Argo CD (HTTPS)"
  type        = string
}

variable "jayanth9632932097" {
  type = string
}

variable "Ajtgjm@9632932097" {
  type = string
}

variable "jaygowda82@gmail.com" {
  type    = string
  default = "example@example.com"
}

variable "grafana_admin_password" {
  type = string
}
