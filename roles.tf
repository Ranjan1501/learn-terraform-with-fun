locals {
    role_polocies = {
        readonly = ["ReadOnlyAccess"],
        maintiner = ["PowerUserAccess"],
        admin = ["AdministratorAccess"],
        developer = ["AmazonS3FullAccess", "AmazonEC2FullAccess"]   
        auditor = ["SecurityAudit"]
        datanalyst = ["AmazonS3ReadOnlyAccess", "AmazonRedshiftReadOnlyAccess"]

    }
}

# let's create a document that we can pass here as the assumed role policy for the role.
data "aws_iam_policy_document" "assume_role_policy" {
    statement {
        effect = "Allow"
        principals {
            type = "AWS"
            identifiers = [""] # it means no body can assume this role.
        }
        actions = ["sts:AssumeRole"] # it means i'll assume role wheneever i come by secure token service(sts)
    }
}

resource "aws_iam_role" "roles" {
    for_each = toset(keys(local.role_polocies))

    name = each.key
    assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


# how to fetch aws managed policy 

data "aws_iam_policy" "managed_policy" {
   for_each = toset(local.role_polocies[*].policy) 
    arn = "arn:aws:iam::aws:policy/${each.value}"
}


#NOTE : whenver we are iteraing over a set each.value  and each.keys will be same 