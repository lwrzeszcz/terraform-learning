resource "google_sql_database_instance" "main" {
    name = "main-db"

    settings {
        tier = "db-f1-micro"
    }
}

resource "google_sql_database" "usr" {
    name = "usr-db"
    instance = "${google_sql_database_instance.main.name}"
    charset = "latin1"
    collation = "latin1_swedish_ci"
}
