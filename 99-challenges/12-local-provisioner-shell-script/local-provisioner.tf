locals {
  dependenciesPath = "./../../dependencies.yaml"
}

resource "null_resource" "gather_dependencies" {
  provisioner "local-exec" {
    command     = "./evaluate_tf_dependencies.sh | tee ${local.dependenciesPath}"
    interpreter = ["/bin/bash", "-c"]
  }

  // this will make sure in every terraform apply, state is destroyed and applied
  triggers = {
    always_run = "${timestamp()}"
  }
}
