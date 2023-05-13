# Импортирование существующего локального публичного ключа 
resource "openstack_compute_keypair_v2" "my-keypair" {
  name                    = "my-keypair"
  public_key              = var.public_key
}

# Создание инстанса с загрузочным диском
resource "openstack_compute_instance_v2" "instance_1" {
  name                    = "instance_1"
  flavor_name             = "ext_4096_p2_50gb"
  availability_zone       = "nova"
  admin_pass              = var.admin_pass
  key_pair                = "my-keypair"
  security_groups         = ["default"]

# Создание диска с которого будет загружаться инстанс и в качестве uuid мы указываем идентификатор image.id
  block_device {
    uuid                  = "c68f1d72-e544-4004-ba2d-96c07c90eb74"
    source_type           = "image"
    volume_size           = 50
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }
  
  network {
    name                  = "Default Network #14114"
  }
}
