variable "project_name" {

}

variable "region" {

}

variable "k8s_version" {
  type = string
}

variable "addon_cni_version" {
  type    = string
  default = "v1.20.4-eksbuild.2"
}

variable "addon_coredns_version" {
  type    = string
  default = "v1.12.1-eksbuild.2"
}

variable "addon_kubeproxy_version" {
  type    = string
  default = "v1.33.3-eksbuild.4"
}

variable "ssm_vpc" {
  type = string
}

variable "ssm_public_subnets" {
  type = list(string)
}

variable "ssm_private_subnets" {
  type = list(string)
}

variable "ssm_pod_subnets" {
  type = list(string)
}

variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
}

variable "nodes_instance_sizes" {
  type = list(string)
}

variable "nodes_instance_sizes_graviton" {
  type = list(string)
}

variable "karpenter_capacity" {
  type = list(object({
    name               = string
    workload           = string
    ami_family         = string
    ami_ssm            = string
    instance_family    = list(string)
    instance_sizes     = list(string)
    capacity_type      = list(string)
    availability_zones = list(string)
  }))
}