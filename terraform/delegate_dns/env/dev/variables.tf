variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "root_domain" {
  type = string
}

variable "sub_domains" {
  type        = list(string)
}