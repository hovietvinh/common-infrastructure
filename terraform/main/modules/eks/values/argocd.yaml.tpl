configs:
  params:
    server.insecure: true
  cm:
    url: https://${argocd_hostname}
server:
  ingress:
    enabled: true
    ingressClassName: nginx
    hostname: ${argocd_hostname}
    annotations:
      nginx.ingress.kubernetes.io/ssl-redirect: "false"

controller:
  replicas: 1
repoServer:
  replicas: 1
applicationSet:
  replicas: 1