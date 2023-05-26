{{- define "global.ingressPathsConfig" -}}
- path:  {{ .path }}
  pathType: Prefix
  backend:
    service:
      name: {{ .serviceName }}
      port:
       number: {{ .port }}
{{- end }}

{{- define "global.imagePullSecret" -}}
imagePullSecrets:
  - name: ghcr-credentials
{{- end }}

{{- define "global.nameService" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-service
{{- end }}

{{- define "global.nameDeployment" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-deployment
{{- end }}

{{- define "global.nameConfigmap" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-configmap
{{- end }}

{{- define "global.nameSecret" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-secret
{{- end }}