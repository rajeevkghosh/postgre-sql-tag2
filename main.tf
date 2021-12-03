provider "google" {
    project = "airline1-sabre-wolverine"
    access_token = var.access_token
    
}

resource "google_sql_database_instance" "master" {
  name             = "us-dev-abcd-fghi-postgres-master1"
  database_version = "POSTGRES_11"
  region           = "us-central1"
  deletion_protection = false

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}
