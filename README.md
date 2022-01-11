This module assumes an aws config recorder is already configured for the account.

Links to AWS Provided Conformance Packs
- https://github.com/awslabs/aws-config-rules/tree/master/aws-config-conformance-packs

### Example Conformance Pack Configuration on AWS S3
```
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
