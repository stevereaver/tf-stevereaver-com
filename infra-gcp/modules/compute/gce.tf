# ----------------------------------------------------------------------------
# Office Hours Schedule
# ----------------------------------------------------------------------------
resource "google_compute_resource_policy" "daily-restart" {
  project     = var.project_id
  name        = "daily-restart"
  region      = var.region
  description = "Start and stop instances"
  instance_schedule_policy {
    vm_start_schedule {
      schedule = "5 0 * * *"
    }
    vm_stop_schedule {
      schedule = "0 0 * * *"
    }
    time_zone = "Australia/Sydney"
  }
}

# ----------------------------------------------------------------------------
# Creating a snapshot daily policy for the Boot Disk
# ----------------------------------------------------------------------------

resource "google_compute_resource_policy" "boot-daily-policy" {
  name    = "pd-bootdisk-snapshot-daily-policy"
  project = var.project_id
  region  = var.region

  snapshot_schedule_policy {
    retention_policy {
      max_retention_days    = 30
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      labels = {
        my_label = "bootdisk"
      }
      storage_locations = ["${var.region}"]
      guest_flush       = false
    }

    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "21:00"
      }
    }
  }
}