resource "aws_iam_user" "demouser" {
    for_each = toset(["Tsavana","Tjessie","TPooja","Tshanit","Tpreethi"])
    name = each.key
  
}
