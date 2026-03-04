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
  type = string
}

variable "memory_mb" {
  type = number
}

variable "cpu_count" {
  type = number
}

variable "vhd_template_path" {
  type = string
}

variable "vhd_output_path" {
  type = string
}

variable "switch_name" {
  type = string
}