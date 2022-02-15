module "gcp_frontend" {
    source  = "../../modules/gcp-gcs"

    //must be provided and replaced by yoursleves
    credentials_file = "goexpert-jr-tf.json"

    project_id  = "goexpert-jr"
    region      = "australia-southeast1"
    bucket_name = "gcp.uat.goexperts.net"
    domain_name = "gcp.uat.goexperts.net"
}
