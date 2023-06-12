{{- define "t-clo-902.ingressPathsConfig" -}}
- path:  {{ .path }}
  pathType: Prefix
  backend:
    service:
      name: {{ .serviceName }}
      port:
       number: {{ .port }}
{{- end }}

{{- define "t-clo-902.nameService" -}}
{{ .Release.Name }}-service
{{- end }}

{{- define "t-clo-902.nameDeployment" -}}
{{ .Release.Name }}-deployment
{{- end }}

{{- define "t-clo-902.nameConfigmap" -}}
{{ .Release.Name }}-configmap
{{- end }}

{{- define "t-clo-902.nameSecret" -}}
{{ .Release.Name }}-secret
{{- end }}

{{- define "t-clo-902.esHost" -}}
{{ .Release.Name }}-es-http
{{- end }}

{{- define "t-clo-902.amqpHost" -}}
{{ .Release.Name }}-rabbitmq
{{- end }}

{{- define "t-clo-902.dbHost" -}}
{{ .Release.Name }}-mysql
{{- end }}

{{- define "t-clo-902.dockerCredentials" -}}
{{ .Release.Name }}-docker-credentials
{{- end }}