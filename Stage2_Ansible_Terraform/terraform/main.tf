provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "example_volume" {
  name   = "example_volume"
  pool   = "default"
  source = "/var/lib/libvirt/images/example.img"
}

resource "libvirt_domain" "example_vm" {
  name   = "example_vm"
  memory = 1024
  vcpu   = 1

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = libvirt_volume.example_volume.id
  }
}
