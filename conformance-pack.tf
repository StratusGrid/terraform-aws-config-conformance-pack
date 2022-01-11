  # The StratusGrid recommended AWS managed Conformance Pack can be added here as part of Starter script. 
locals {
  stratusgrid_recommended_aws_provided_defaults = {
    iam-best-practice = "https://raw.githubusercontent.com/awslabs/aws-config-rules/master/aws-config-conformance-packs/Operational-Best-Practices-for-AWS-Identity-and-Access-Management.yaml",
    s3-best-practice = "https://raw.githubusercontent.com/awslabs/aws-config-rules/master/aws-config-conformance-packs/Operational-Best-Practices-for-Amazon-S3.yaml"
  }

  # Placeholder for future SG Created custom Conformance Packs
  stratusgrid_recommended_custom_defaults = {}

  stratusgrid_recommended_aws_provided_default_yamls = var.use_recommended_aws_defaults ? zipmap(keys(local.stratusgrid_recommended_aws_provided_defaults), [for pack in data.http.aws_conformance_packs: pack.body]) : tomap({})
  stratusgrid_recommended_custom_defaults_yamls = var.use_recommened_custom_defaults ? zipmap(keys(local.stratusgrid_recommended_custom_defaults), [for pack in data.http.sg_conformance_packs: pack.body]) : tomap({})
  conformance_packs_yamls = merge(local.stratusgrid_recommended_aws_provided_default_yamls, local.stratusgrid_recommended_custom_defaults_yamls, var.extra_conformance_pack_yamls)
}

data "http" "aws_conformance_packs" {
  for_each = local.stratusgrid_recommended_aws_provided_defaults
  url = each.value
}

data "http" "sg_conformance_packs" {
  for_each = local.stratusgrid_recommended_aws_provided_defaults
  url = each.value
}

resource "aws_config_conformance_pack" "this" {
  for_each = local.conformance_packs_yamls
  name = "${var.name}-${each.key}"
  template_body = each.value
}

