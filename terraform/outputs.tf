output "vm_name" {
  value = hyperv_machine_instance.vm.name
}

output "vm_state" {
  value = hyperv_machine_instance.vm.state
}

output "vm_ip" {
  description = "IP address of the created VM"
    value = hyperv_machine_instance.vm.network_adaptors[0].wait_for_ips
}