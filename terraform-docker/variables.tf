variable "image" {
  type = map
  description = "image for container"
  default = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "int_port" {
  type    = number
  default = 1880
  
  validation {
    condition = var.int_port == 1880
    error_message = "The internal port must be 1880"
  }
}

variable "ext_port" {
  type    = map

  validation {
    condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
    error_message = "The external port must be greater than or equal to 1980 and less than 65536"
  }
  
  validation {
    condition = max(var.ext_port["prod"]...) <= 65535 && min(var.ext_port["prod"]...) >= 1880
    error_message = "The external port must be greater than or equal to 1880 and less than 65536"
  }
}

locals {
  container_count = length(var.ext_port[terraform.workspace])
}