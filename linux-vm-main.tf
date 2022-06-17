# Bootstrapping Script to Install JMeter
data "template_file" "linux-metadata" {
  template = file("scripts/add-ssh-web-app.yaml")
}
