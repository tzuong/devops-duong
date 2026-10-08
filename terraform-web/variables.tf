variable "server_name" {
  description = "Prefix name of web servers"
  type        = string
}

variable "server_count" {
  description = "Number of web servers"
  type        = number
}

variable "cpu" {
  description = "CPU requested for each server"
  type        = number
}

variable "ram" {
  description = "RAM requested for each server in MB"
  type        = number
}

variable "disk" {
  description = "Disk requested for each server in GB"
  type        = number
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}

variable "region" {
  description = "Deployment region"
  type        = string
}

variable "ubuntu_image" {
  description = "Ubuntu Docker image"
  type        = string
  default     = "ubuntu:24.04"
}

variable "web_ports" {
  description = "Host ports for web servers"
  type        = list(number)
}