output "IP_ADDRESS" {
  value       = [for i in docker_container.nodered_container[*] : join(":", i.network_data[*]["ip_address"], i.ports[*]["external"])]
  description = "The ip adderss and the external port of the container."
}

output "container_name" {
  value       = docker_container.nodered_container[*].name
  description = "The name of the container"
}
