provider "google" {
  project = "cs-poc-hpzdycpiqjyvinhrczvlwcn"
  region  = "europe-west10"
}

resource "google_storage_bucket" "public_bucket" {
  name          = "bucket-quelpoke-public" 
  location      = "europe-west10"
  storage_class = "STANDARD"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.public_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

terraform {
  backend "gcs" {
    bucket = "ton-nom-de-bucket-terraform"
    prefix = "terraform/state"
  }
}


output "public_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.public_bucket.name}/"
}
