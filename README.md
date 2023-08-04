# Terraform SNS Module

Terraform module which creates SNS resources on AWS.

## Usage

```hcl
module "sns" {
  source = "github.com/paulo-tinoco/terraform-sns-module"

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
