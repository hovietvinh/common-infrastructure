variable "ecr_repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "ecr_scan_on_push" {
  type        = bool
  description = "Enable image scanning on push"
}

variable "ecr_image_count" {
  type        = number
  description = "Number of images to keep (auto-delete older)"
}

variable "project_name" {
  type = string
}

variable "env" {
  type = string
}
