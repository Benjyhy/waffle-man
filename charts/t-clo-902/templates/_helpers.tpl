{{- define "t-clo-902.ingressPathsConfig" -}}
- path:  {{ .path }}
  pathType: Prefix
  backend:
    service:
      name: {{ .serviceName }}
      port:
       number: {{ .port }}
{{- end }}

{{- define "imagePullSecret.noEnc" }}

{{- $username := (printf .Values.dockerImageCredentials.username) }}
{{- $registry := (printf .Values.dockerImageCredentials.registry) }}
{{- $email := (printf .Values.dockerImageCredentials.email) }}
{{- $password := (printf .Values.dockerImageCredentials.accessToken) }}
{{- $auth := (printf "%s:%s" $username $password  | b64enc) }}

{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" $registry $username $password $email $auth}}
{{- end }}

{{- define "dockerconfigjson.b64enc" }}
  {{- include "imagePullSecret.noEnc" . | b64enc }}
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
elasticsearch-{{ .Release.Name }}-es-http
{{- end }}

{{- define "t-clo-902.amqpHost" -}}
amqp-{{ .Release.Name }}-rabbitmq
{{- end }}

{{- define "t-clo-902.dbHost" -}}
{{ .Release.Name }}-mysql
{{- end }}

{{- define "t-clo-902.dockerCredentials" -}}
{{ .Release.Name }}-docker-credentials
{{- end }}