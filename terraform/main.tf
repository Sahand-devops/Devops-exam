resource "hyperv_vhd" "vm_disk" {
  path   = var.vhd_output_path
  source = var.vhd_template_path
}

resource "hyperv_machine_instance" "vm" {
  name                 = var.vm_name
  generation           = 2
  static_memory        = true
  memory_startup_bytes = var.vm_memory_mb * 1024 * 1024
  processor_count      = var.vm_cpu
  state                = "Running"

  hard_disk_drives {
    controller_type     = "SCSI"
    controller_number   = 0
    controller_location = 0
    path                = hyperv_vhd.vm_disk.path
  }

  network_adaptors {
    name        = "wan"
    switch_name = var.switch_name
  }

  vm_firmware {
    enable_secure_boot   = "On"
    secure_boot_template = "MicrosoftUEFICertificateAuthority"

    preferred_network_boot_protocol = "IPv4"
    console_mode                    = "None"
    pause_after_boot_failure        = "Off"

    boot_order {
      boot_type           = "HardDiskDrive"
      controller_number   = 0
      controller_location = 0
    }

    boot_order {
      boot_type            = "NetworkAdapter"
      network_adapter_name = "wan"
    }
  }
}
