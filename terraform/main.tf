variable "mytags" {
  type = "map"
  default = {
    system = ""
  }
}

variable "myregion" { default = "asia-northeast1" } #us-central,asia-northeast1

// Configure the Google Cloud provider
provider "google" {
//  project     = ""
  region      = "${var.myregion}" 
}
