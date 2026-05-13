variable "bucket_name" {
  type        = string
  description = "Bucket Name for store statefile"
  default     = null
}

variable "location" {
  type        = string
  description = "Bucket Location"
  default     = null
}

variable "storage_class" {
  type        = string
  description = "Storage Class"
  default     = null
}

variable "environment" {
  type        = string
  description = "Environment Name"
  default     = null
}