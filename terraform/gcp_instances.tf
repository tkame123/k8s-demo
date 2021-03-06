# fireWall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = "${google_compute_network.nw.name}"
  description = "managed by terraform"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  # source_tags = [""]
  # target_tags = ["${var.mytags["system"]}"]
}

resource "google_compute_firewall" "allow-test" {
  name    = "allow-test"
  network = "${google_compute_network.nw.name}"
  description = "managed by terraform"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  # source_tags = [""]
  # target_tags = ["${var.mytags["system"]}"]
}

# instances
resource "google_compute_instance" "node1" {
  name         = "node1"
  machine_type = "g1-small"
  zone         = "asia-northeast1-c" 

  description  = "managed by terraform"
  # tags         = ["${var.mytags["system"]}"]

  labels {
    system = "${var.mytags["system"]}"
  }

  boot_disk {
    initialize_params {
      image = "coreos-cloud/coreos-stable"
      size = 50
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
    }

    subnetwork = "${google_compute_subnetwork.nw-subnet.name}"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro", "bigquery", "monitoring"]
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }

  # metadata {
  #   sshKeys = "${var.gce_ssh_user}:${file("${var.gce_ssh_pub_key_file}")}"
  # }
}
