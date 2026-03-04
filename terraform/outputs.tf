output "vm_name" {
  value = hyperv_machine_instance.vm.name
}

output "vm_state" {
  value = hyperv_machine_instance.vm.state
}

output "vm_ip" {
  value = hyperv_machine_instance.vm.network_adaptors[0].ip_addresses[0]
}