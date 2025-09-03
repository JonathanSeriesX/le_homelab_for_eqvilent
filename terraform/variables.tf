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
  default = "g6-dedicated-2" # I just want this stuff to run a bit faster tbh
}

variable "app_type" {
  type    = string
  default = "g6-standard-1" # fuck it we ball
}

variable "app_volume_size_gb" {
  type    = number
  default = 10 # as per https://ciq.com/blog/how-to-install-the-freeipa-server-on-rocky-linux-9/
}
