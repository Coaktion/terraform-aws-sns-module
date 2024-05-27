# Terraform SNS Module

Módulo Terraform para criação de recursos SNS na AWS.

## Usage

```hcl
module "sns" {
  source = "github.com/Coaktion/terraform-aws-sns-module"

  topics = [
    {
      name = "my_topic"
      fifo_topic = false
    },
    {
      name = "my_fifo_topic"
      content_based_deduplication = true
    }
  ]
  resource_prefix = "prefix_topic"
  default_fifo_topic = true
}
```
