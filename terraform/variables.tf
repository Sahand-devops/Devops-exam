variable "hyperv_host" {
  type        = string
  description = "Hyper-V host IP or hostname"
}

variable "hyperv_user" {
  type        = string
  description = "WinRM username"
}

variable "hyperv_password" {
  type        = string
  sensitive   = true
  description = "WinRM password"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_memory_mb" {
  type        = number
  description = "Startup memory in MB"
}

variable "vm_cpu" {
  type        = number
  description = "Number of virtual CPUs"
}

variable "vhd_template_path" {
  type        = string
  description = "Path to base template VHD"
}

variable "vhd_output_path" {
  type        = string
  description = "Path where new VHD will be created"
}

variable "switch_name" {
  type        = string
  description = "Existing Hyper-V switch name"
}