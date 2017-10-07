output "ipv4_adresses" {
  value       = ["${digitalocean_droplet.node.*.ipv4_address}"]
  type        = "list"
  description = "The nodes public ipv4 adresses"
}

output "ipv4_adresses_private" {
  value       = ["${digitalocean_droplet.node.*.ipv4_address_private}"]
  type        = "list"
  description = "The nodes private ipv4 adresses"
}

output "droplet_ids" {
  value       = ["${digitalocean_droplet.node.*.id}"]
  description = "The droplet ids"
}

output "droplet_hostnames" {
  value       = ["${digitalocean_droplet.node.*.name}"]
  description = "The droplet names"
}
