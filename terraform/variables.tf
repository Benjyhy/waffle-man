// Need to be set as ENV VARIABLE with with prefix TF_VAR_
variable kube_service_name {
    type = string
}
variable ovh_application_key {
    type = string
}
variable ovh_application_secret {
    type = string
}
variable ovh_consumer_key {
    type = string
}

variable "kube_cluster_name" {
    default = "kubi"
    type = string
}

variable "kube_region" {
    type = string
    default = "SBG5"
}

variable "kube_version" {
    type = number
    default = 1.26
}