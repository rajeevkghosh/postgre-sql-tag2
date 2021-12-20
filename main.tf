provider "google" {
  project = "airline1-sabre-wolverine"
  #credentials = file ("../airline1-sabre-wolverine-a3e5fdad24ee.json")

}
provider "google-beta" {
  project = "airline1-sabre-wolverine"
  #credentials = file ("../airline1-sabre-wolverine-a3e5fdad24ee.json")

}


resource "google_sql_database_instance" "master2" {
  provider            = google-beta #provider google-beta is used to enforce cmek
  project             = "airline1-sabre-wolverine"
  name                = "wf-us-prod-sql-app01-instance08"
  database_version    = "POSTGRES_11"
  region              = "us-central1"
  deletion_protection = false
  encryption_key_name = data.google_kms_crypto_key.crypto_key13.id

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
    user_labels = {
      application_division = "pci",
      application_name     = "demo",
      application_role     = "app",
      au                   = "0223092",
      created              = "20211122",
      environment          = "nonprod",
      gcp_region           = "us",
      owner                = "hybridenv",
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = "projects/airline1-sabre-wolverine/global/networks/default"
    }

  }
}
data "google_kms_crypto_key" "crypto_key13" {
  name     = "wf-us-prod-kms-app01-res0501"
  key_ring = data.google_kms_key_ring.key_ring.id
}

data "google_kms_key_ring" "key_ring" {
  name     = "wf-us-prod-kms-app01-res05"
  location = "us-central1"
}




