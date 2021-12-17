provider "google" {
  project = "airline1-sabre-wolverine"

}
provider "google-beta" {
  project = "airline1-sabre-wolverine"

}

resource "google_sql_database_instance" "master2" {
  provider            = google-beta
  project             = "airline1-sabre-wolverine"
  name                = "wf-us-prod-sql-app01-instance01"
  database_version    = "POSTGRES_11"
  region              = "us-central1"
  deletion_protection = false
  encryption_key_name = data.google_kms_crypto_key.crypto_key13.id


  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"

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




