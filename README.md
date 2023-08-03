# Terraform SNS Module

Terraform module which creates SNS resources on AWS.

## Usage

```hcl
module "sns" {
  source = "github.com/paulo-tinoco/terraform-sns-module"

  topics = [
    {
      name = "name_service_example"
    },
  ]
  resource_prefix = "visual_triggers"
  fifo_topic = true
}
```
