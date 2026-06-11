variable "virtual_machine_name" {
    type = string
}

variable "location" {
    type = string 
}

variable "resource_group_name" {
    type = string
}

variable "vm_size" {
    type = string
    default = "Standard_B2s"
}

variable "subnet_id" {
    type = string
}

variable "admin_username" {
    type    = string
    default = "siddhant"
}

variable "admin_password" {
    type    = string
    default = "Password@123"
}