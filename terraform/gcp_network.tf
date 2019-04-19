# gcp_network.tf
resource "google_compute_network" "nw" {
  name = "nw"
  description = "managed by terraform"
}
resource "google_compute_subnetwork" "nw-subnet" {
  name          = "nw-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = "${google_compute_network.nw.name}"
  description   = "managed by terraform"
  region        = "${var.myregion}"
}
