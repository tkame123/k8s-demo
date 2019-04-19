
# instances
resource "google_compute_instance" "node1" {
  name         = "node1"
  machine_type = "g1-small"
  zone         = "asia-northeast1-c" 

  description  = "managed by terraform"
  # tags         = ["${var.mytags["system"]}"]

//  labels {
//    system = "${var.mytags["system"]}"
//  }

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
