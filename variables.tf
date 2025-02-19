variable "subscription-id" {
  type        = string
}
variable "client-id" {
  type        = string
}
variable "tenant-id" {
  type        = string
}
variable "client-secret" {
  type        = string
  sensitive   = true
}

variable "storage_account_name" {

}
variable "container-name" {

}
variable "resource_group-name" {

}

variable "virtual_network-name" {
  default = "My-vent1"
}
variable "subnet-name" {
  default = "subnet1"
}

variable "nic-name" {
  default = "vm1-nic"
}
variable "vm-name" {
  default = "vm1"
}
