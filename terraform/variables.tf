variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "Central India"
}

variable "min_node_count" {
  type = map(number)
  description = "Minimum node count per environment workspace"
  default = {
    default = 1
    dev     = 1
    staging = 2
  }
}

variable "max_node_count" {
  type = map(number)
  description = "Maximum node count per environment workspace"
  default = {
    default = 3
    dev     = 2
    staging = 4
  }
}