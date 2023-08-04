locals {
  topics = flatten([
    for topic in var.topics :
    {
      name       = var.resource_prefix != "" ? "${var.resource_prefix}__${topic.name}" : topic.name
      fifo_topic = topic.fifo_topic != null ? topic.fifo_topic : var.default_fifo_topic
      content_based_deduplication = lookup(topic, "content_based_deduplication", false)
    }
  ])

  sns_topics = {
    for topic in local.topics : topic.fifo_topic ? "${topic.name}.fifo" : topic.name => topic
  }
}

resource "aws_sns_topic" "sns_topics" {
  for_each = local.sns_topics

  name       = each.key
  fifo_topic = each.value.fifo_topic
  content_based_deduplication = each.value.content_based_deduplication

  tags = var.default_tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
