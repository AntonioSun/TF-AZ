# Bootstrapping Script to Install JMeter
data "template_file" "cloud-init" {
  template = file("scripts/add-ssh-web-app.yaml")
}
