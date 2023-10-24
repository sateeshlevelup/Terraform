resource "aws_s3_bucket" "mys3bucket" {

    for_each = {
      dev = "my-devapp-bucket"
      qa = "my-qaapp-bucket"
      stage = "my-stageapp-bucket"
      prod = "my-prodapp-bucket"

       
    }

    bucket ="${each.key}-${each.value}"
    tags = {
      Environment = each.key
      bucketname = "${each.key}-${each.value}"
      eachvalue = each.value
    }
  
}
