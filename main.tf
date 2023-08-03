locals {
  sns_topics = {
    for topic in var.topics : var.resource_prefix != "" ? "${var.resource_prefix}__${topic.name}" : topic.name => topic
  }
}

resource "aws_sns_topic" "sns_topics" {
  for_each = local.sns_topics

  name       = try(each.value.fifo_topic, var.fifo_topic) ? "${each.key}.fifo" : "${each.key}"
  fifo_topic = try(each.value.fifo_topic, var.fifo_topic)

  tags = var.default_tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
