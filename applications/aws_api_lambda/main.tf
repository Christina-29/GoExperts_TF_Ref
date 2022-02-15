module "upload_images_lambda" {
    source      = "../../modules/lambda-api-gateway/"
    aws_region  = "ap-southeast-2"
    prefix      = "goexpert-process-lambda"
    func        = "upload-images"
    func_dir    = "upload-images"
    entrypoint  = "upload-images"
}

//storage images
module "store_images_lambda" {
    source      = "../../modules/lambda-api-gateway/"
    aws_region  = "ap-southeast-2"
    prefix      = "goexpert-process-lambda"
    func        = "store-images"
    func_dir    = "store-images"
    entrypoint  = "store-images"
}

module "download_images_lambda" {
    source      = "../../modules/lambda-api-gateway/"
    aws_region  = "ap-southeast-2"
    prefix      = "goexpert-process-lambda"
    func        = "download-images"
    func_dir    = "download-images"
    entrypoint  = "download-images"
}
