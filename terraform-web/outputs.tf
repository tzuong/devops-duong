output "server_names" {
  description = "Names of web servers"

  value = [
    for container in docker_container.web :
    container.name
  ]
}

output "server_ports" {
  description = "HTTP ports"

  value = var.web_ports
}

output "server_urls" {
  description = "URLs of web servers"

  value = [
    for port in var.web_ports :
    "http://localhost:${port}"
  ]
}

output "network_name" {
  description = "Docker network"

  value = docker_network.web_network.name
}

output "server_count" {
  description = "Number of servers"

  value = var.server_count
}

output "region" {
  description = "Deployment region"

  value = var.region
}