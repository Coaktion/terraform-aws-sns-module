output "sns_topics" {
    value = aws_sns_topic.sns_topics
}

output "locals_sns_topics" {
    value = local.sns_topics
}