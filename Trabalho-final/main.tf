# Requisito 2.1: provider e decisao do raiz (regiao, credenciais, tags).
provider "aws" {
  region = "us-east-1"

  # default_tags: tags de governanca aplicadas a todos os recursos do provider.
  default_tags {
    tags = {
      Project   = "quantum-commerce"
      ManagedBy = "terraform"
      Lab       = "trabalho-final"
    }
  }
}

# Requisito 2.2/2.3: o raiz chama o modulo e passa a quantidade de nos a partir
# do workspace — a expressao direto no bloco module, sem local nem variavel.
module "web_cluster" {
  source = "./modules/web-cluster"

  node_count = terraform.workspace == "prod" ? 3 : 1
}
