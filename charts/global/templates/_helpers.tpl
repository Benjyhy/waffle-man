{{- define "ingressPathsConfig" -}}
- path:  {{ .path }}
  pathType: Prefix
  backend:
    service:
      name: {{ .serviceName }}
      port:
       number: {{ .port }}
{{- end }}

{{- define "imagePullSecret" -}}
imagePullSecrets:
  - name: ghcr-credentials
{{- end }}

{{- define "nameService" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-service
{{- end }}

{{- define "nameDeployment" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-deployment
{{- end }}

{{- define "nameConfigmap" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-configmap
{{- end }}

{{- define "nameSecret" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-secret
{{- end }}