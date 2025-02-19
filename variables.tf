variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "client_secret" {
  type      = string
  sensitive = true
}

variable "storage_account_name" {

}
variable "container_name" {

}
variable "resource_group_name" {

}

variable "virtual_networkname" {
  default = "My-vent1"
}
variable "subnetname" {
  default = "subnet1"
}

variable "nicname" {
  default = "vm1-nic"
}
variable "vmname" {
  default = "vm1"
}
variable "vm_pass" {
  type      = string
  sensitive = true

}
