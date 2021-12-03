provider "google" {
  project = "airline1-sabre-wolverine"

}
provider "google-beta" {
  project = "airline1-sabre-wolverine"

}

resource "google_sql_database_instance" "master2" {
  provider            = google-beta
  project             = "airline1-sabre-wolverine"
  name                = "us-dev-abcd-fghi-postgres-master10"
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
  name     = "us-dev-abcd-fghi-cryptokey13"
  key_ring = data.google_kms_key_ring.key_ring.id
}

data "google_kms_key_ring" "key_ring" {
  name     = "us-dev-abcd-fghi-keyring1"
  location = "us-central1"
}




