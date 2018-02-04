variable "do_token" {
  description = "DigitalOcean API token with read/write permissions"
}

variable "domain" {
  description = "Domain name used in droplet hostnames, e.g example.com"
}

variable "join_token" {
  description = "Join token for the nodes"
}

variable "manager_public_ip" {
  description = "Public ip adress of a manager node, used to unregister a node in the Docker swarm cluster on destroy"
}

variable "manager_private_ip" {
  description = "Private ip adress of a manager node, used to have a node join the existing cluster"
}

variable "ssh_keys" {
  type        = "list"
  description = "A list of SSH IDs or fingerprints to enable in the format [12345, 123456] that are added to worker nodes"
}

variable "provision_ssh_key" {
  default     = "~/.ssh/id_rsa"
  description = "File path to SSH private key used to access the provisioned nodes. Ensure this key is listed in the manager and work ssh keys list"
}

variable "provision_user" {
  default     = "core"
  description = "User used to log in to the droplets via ssh for issueing Docker commands"
}

variable "region" {
  description = "Datacenter region in which the cluster will be created"
  default     = "ams3"
}

variable "total_instances" {
  description = "Total number of instances of this type in cluster"
  default     = 1
}

variable "image" {
  description = "Operating system for the worker nodes"
  default     = "coreos-alpha"
}

variable "size" {
  description = "Droplet size of worker nodes"
  default     = "s-1vcpu-1gb"
}

variable "backups" {
  default     = false
  description = "Enable backups of the worker nodes"
}

variable "name" {
  description = "Prefix for name of worker nodes"
  default     = "worker"
}

variable "user_data" {
  description = "User data content for worker nodes. Use this for installing a configuration management tool, such as Puppet or installing Docker"
  default     = ""
}

variable "tags" {
  description = "List of DigitalOcean tag ids"
  default     = []
  type        = "list"
}

variable "availability" {
  description = "Availability of the node ('active'|'pause'|'drain')"
  default     = "active"
}
