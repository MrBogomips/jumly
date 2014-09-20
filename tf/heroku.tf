variable "email" {}
variable "api_key" {}

provider "heroku" {
    email = "${var.email}"
    api_key = "${var.api_key}"
}

resource "heroku_app" "default" {
    name = "jumly"
    stack = "cedar"
    region = "us"
    config_vars {
        GH_JUMLY_URL="https://github.com/tmtk75/jumly"
    }
}

output "default.web_url" {
    value = "${heroku_app.default.web_url}"
}
