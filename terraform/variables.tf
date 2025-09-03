variable "token" {
  type        = string
  description = "Linode API token"
}

variable "region" {
  type    = string
  default = "es-mad"
}

variable "label" {
  type    = string
  default = "tfwnogf"
}

variable "ssh_pub_key" {
  type = string
}

variable "root_pass" {
  type      = string
  sensitive = true
}

variable "ipa_type" {
  type    = string
  default = "g7-premium-2" # I just want this stuff to run a bit faster tbh
}

variable "app_type" {
  type    = string
  default = "g6-dedicated-2" # fuck it we ball
}
