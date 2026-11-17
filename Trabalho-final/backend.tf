# Requisito 3.2: state remoto no S3, com lock nativo (use_lockfile). Com
# workspaces, cada ambiente fica em env:/dev/trabalho-final/terraform.tfstate
# e env:/prod/trabalho-final/terraform.tfstate — nunca se sobrescrevem.
# Troque base-config-<SEU-RM> pelo nome do seu bucket (passo 3.1: aws s3 ls | awk '/base-config-/{print $3; exit}').
terraform {
  backend "s3" {
    bucket       = "base-config-<SEU-RM>"
    key          = "trabalho-final/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
