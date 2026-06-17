terraform {
    backend "s3" {
        bucket = "my-tf-state-nad"
        key = "node_js_static/s3/terraform.tfstate"
        region = "eu-central-1"
        use_lockfile = true
    }
} 