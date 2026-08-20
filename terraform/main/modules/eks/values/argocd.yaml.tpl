configs:
  params:
    server.insecure: true
  cm:
    url: https://${argocd_hostname}
server:
  ingress:
    enabled: true
    ingressClassName: alb
    hostname: ${argocd_hostname}
    annotations:
      alb.ingress.kubernetes.io/group.name: common-shared-alb
      alb.ingress.kubernetes.io/scheme: internet-facing
      alb.ingress.kubernetes.io/target-type: ip
      alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
      alb.ingress.kubernetes.io/backend-protocol: HTTP