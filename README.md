<!-- BEGIN_TF_DOCS -->
# Terraform Multiaccount Pipeline

This module assumes an aws config recorder is already configured for the account.

Links to AWS Provided Conformance Packs
- https://github.com/awslabs/aws-config-rules/tree/master/aws-config-conformance-packs

---

## Example with Git Source

```hcl
data "http" "some_external_conformance_pack" {
  url = "https://raw.githubusercontent.com/awslabs/aws-config-rules/master/aws-config-conformance-packs/Operational-Best-Practices-for-AWS-Identity-and-Access-Management.yaml"
}

module "aws_config_conformance_pack" {
  source = "StratusGrid/config-conformance-pack/aws"
  
  name = "sg_aws_config_conformance_pack"

  use_recommended_aws_defaults = True
  use_recommened_custom_defaults = False
  extra_conformance_pack_yamls = [
    data.http.some_external_conformance_pack.body
  ]

  input_tags = {
    Provisioner = "Terraform"
    Customer = "Application"
  }
}
```

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.28 |

## Resources

| Name | Type |
|------|------|
| [aws_config_conformance_pack.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_conformance_pack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_conformance_pack_yamls"></a> [extra\_conformance\_pack\_yamls](#input\_extra\_conformance\_pack\_yamls) | extra conformance pack yaml files | `map` | `{}` | no |
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map` | <pre>{<br>  "Developer": "StratusGrid",<br>  "Provisioner": "Terraform"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | String to use on object names | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | String to use as prefix on object names | `string` | n/a | yes |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | String to append to object names. This is optional, so start with dash if using. | `string` | `""` | no |
| <a name="input_use_recommended_aws_defaults"></a> [use\_recommended\_aws\_defaults](#input\_use\_recommended\_aws\_defaults) | aws conformance pack | `bool` | `false` | no |
| <a name="input_use_recommened_custom_defaults"></a> [use\_recommened\_custom\_defaults](#input\_use\_recommened\_custom\_defaults) | SG custom conformance pack | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_conformance_pack_arn"></a> [conformance\_pack\_arn](#output\_conformance\_pack\_arn) | ARN of aws config conformance pack |

---

Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->