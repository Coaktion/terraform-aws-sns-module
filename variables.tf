variable "default_fifo_topic" {
    description = "Boolean designating a FIFO topic. If not set, it defaults to false making it standard."
    type = bool
    default = false
}

variable "topics" {
    description = "A list of maps describing the topics to create. Each map must contain a name key. The following keys are optional: display_name, kms_master_key_id, policy, delivery_policy, sqs_success_feedback_sample_rate, sqs_failure_feedback_sample_rate, sqs_max_message_size, sqs_message_retention_seconds, sqs_receive_wait_time_seconds, sqs_visibility_timeout_seconds, sqs_delay_seconds, fifo_topic, content_based_deduplication, application_success_feedback_sample_rate, application_failure_feedback_sample_rate, application_max_message_size, application_message_retention_seconds, application_delivery_policy, application_receive_wait_time_seconds, application_visibility_timeout_seconds, application_delay_seconds, application_success_feedback_role_arn, application_failure_feedback_role_arn, application_success_feedback_target_arn, application_failure_feedback_target_arn, topics_to_subscribe."
    type = list(object({
        name = string
        fifo_topic = optional(bool)
        content_based_deduplication = optional(bool)
    }))
}

variable "default_tags" {
    description = "A map of tags to assign to all resources."
    type = map(string)
    default = {}
}

variable "resource_prefix" {
    description = "A prefix to add to all resource names."
    type = string
    default = ""
}
