variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map
  default = {
    Developer   = "StratusGrid"
    Provisioner = "Terraform"
  }
}

variable "name_prefix" {
  description = "String to use as prefix on object names"
  type        = string
}

variable "name" {
  description = "String to use on object names"
  type        = string
}

variable "name_suffix" {
  description = "String to append to object names. This is optional, so start with dash if using."
  type        = string
  default     = ""
}

variable "use_recommended_aws_defaults" {
  description = "aws conformance pack"
  type        = bool
  default = false
}

variable "use_recommened_custom_defaults" {
  description = "SG custom conformance pack"
  type        = bool
  default = false
}

variable "extra_conformance_pack_yamls" {
  description = "extra conformance pack yaml files"
  type    = map
  default = {}
}
