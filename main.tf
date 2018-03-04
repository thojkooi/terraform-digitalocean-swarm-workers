provider "digitalocean" {
  version = "~> 0.1"
  token   = "${var.do_token}"
}

resource "digitalocean_droplet" "node" {
  ssh_keys           = "${var.ssh_keys}"
  image              = "${var.image}"
  region             = "${var.region}"
  size               = "${var.size}"
  private_networking = true
  backups            = "${var.backups}"
  ipv6               = false
  user_data          = "${var.user_data}"
  tags               = ["${var.tags}"]
  count              = "${var.total_instances}"
  name               = "${format("%s-%02d.%s.%s", var.name, count.index + 1, var.region, var.domain)}"

  connection {
    type        = "ssh"
    user        = "${var.provision_user}"
    private_key = "${file("${var.provision_ssh_key}")}"
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "while [ ! $(sudo docker info) ]; do sleep 2; done",
      "sudo docker swarm join --token ${var.join_token} --availability ${var.availability} ${var.manager_private_ip}:2377",
    ]
  }

  provisioner "remote-exec" {
    when = "destroy"

    inline = [
      "docker swarm leave",
    ]

    on_failure = "continue"
  }
}
