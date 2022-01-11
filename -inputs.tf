### Commented out name_prefix and name_suffix since there can only be one config stream and you don't see the name anywhere
### When you have names and the name changes, it requires manual intervention.

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map
  default = {
    Developer   = "StratusGrid"
    Provisioner = "Terraform"
  }
}

###### Conformance Pack Variables

variable "name" {
  type = string
  description = "String used in naming resources created by module"
}

variable "use_recommended_aws_defaults" {
  type = bool
  default = false
}

variable "use_recommened_custom_defaults" {
  type = bool
  default = false
}

variable "extra_conformance_pack_yamls" {
  type = map(string)
  default = {}
}
