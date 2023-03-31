variable "scope" {
  type    = string
  default = null
  validation {
    condition     = var.scope == null ? false : can(regex("^/(?:subscriptions/[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[0-9a-fA-F]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}(?:/resourceGroups/)?|providers/Microsoft\\.Management/managementGroups/)", var.scope)) || can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.scope))
    error_message = "The scope must be a valid Azure scope."
  }
  description = <<-EOD
  Sets the scope for role creation.
  EOD
}

variable "assignable_scopes" {
  type    = list(string)
  default = []
  validation {
    condition     = var.assignable_scopes == null ? true : length(join("", [for scope in var.assignable_scopes : can(regex("^/(?:subscriptions/[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[0-9a-fA-F]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}(?:/resourceGroups/)?|providers/Microsoft\\.Management/managementGroups/)", scope)) ? "x" : ""])) == length(var.assignable_scopes)
    error_message = "Each assignable scope must be empty or a valid scope."
  }
  description = <<-EOD
  Sets additional assignable scopes for the custom role; default is an empty list.
  EOD
}

variable "name" {
  type    = string
  default = null
  validation {
    condition     = var.name == null || var.name == "" || can(regex("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[0-9a-fA-F]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$", var.name))
    error_message = "The name variable must be empty or a valid UUID."
  }
  description = <<-EOD
  A name to use for the new role; default is an empty string which will
  generate a unique identifier. If a value is provided, it must be valid within
  the scope indicated by `scope` variable.
  EOD
}

variable "description" {
  type        = string
  default     = null
  description = <<-EOD
  The optional description to assign to the custom Azure role. If left blank (default),
  a suitable description will be created.
  EOD
}

variable "principals" {
  type    = set(string)
  default = []
  validation {
    condition     = var.principals == null || length(join("", [for principal in var.principals : can(regex("^^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[0-9a-fA-F]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$$", principal)) ? "x" : ""])) == length(var.principals)
    error_message = "Each principal value must be a valid UUID."
  }
  description = <<-EOD
  An optional set of service principals UUIDs that will be assigned the custom
  role. Default is an empty set.
  EOD
}
