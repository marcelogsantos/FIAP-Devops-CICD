output "address" {
  description = "Mapa id-da-instancia => DNS publico de cada servidor da frota."
  value = {
    for instance in aws_instance.web :
    instance.id => "http://${instance.public_dns}"
  }
}

# Requisito 1.4: output renomeado de alb_public para alb_dns. O raiz reexpoe
# esse valor e os jobs smoke-* leem com terraform output -raw alb_dns.
output "alb_dns" {
  description = "DNS publico do Application Load Balancer (ponto de entrada da frota)."
  value       = aws_lb.web.dns_name
}
