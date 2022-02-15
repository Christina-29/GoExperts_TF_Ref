module "gke_backend" {
    source  = "../../modules/gcp-gke-vpc"

    project_id  = "goexpert-jr"
    location    = "australia-southeast1-a"
    region      = "australia-southeast1"
    gke_num_nodes   = 2
    cluster_name    = "goexperts-cluster"
    machine_type    = "g1-small"
}
