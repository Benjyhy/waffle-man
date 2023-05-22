{{- define "t-clo-902.ingressPathsConfig" -}}
- path:  {{ .path }}
  pathType: Prefix
  backend:
    service:
      name: {{ .serviceName }}
      port:
       number: {{ .port }}
{{- end }}

{{- define "t-clo-902.imagePullSecret" -}}
imagePullSecrets:
  - name: ghcr-credentials
{{- end }}