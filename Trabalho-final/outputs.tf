# Requisito 2.4: output que os jobs smoke-* leem com terraform output -raw alb_dns
# e o make status le direto do state no S3.
output "alb_dns" {
  description = "DNS publico do ALB do ambiente (workspace) atual."
  value       = module.web_cluster.alb_dns
}
