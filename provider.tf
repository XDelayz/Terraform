terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack   = {
      source    = "terraform-provider-openstack/openstack"
      version   = "~> 1.49.0"
    }
  }
}


provider "openstack" {
  user_name     = var.user_name
  tenant_name   = var.tenant
  password      = var.password
  auth_url      = var.auth_url

}

/* 
В целях безопасности чтобы не предоставлять в коде свои креды, 
мы отдельным файлом создаем var.tf в котором будет список 
значений для переменных таких как var.user_name, var.tenant, var.password
Пример переменной:
variable "user_name" {
  type    = string
  default = "Ваш реальный user_name"
}

*/
