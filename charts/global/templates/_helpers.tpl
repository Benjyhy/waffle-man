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

{{- define "t-clo-902.nameService" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-service
{{- end }}

{{- define "t-clo-902.nameDeployment" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-deployment
{{- end }}

{{- define "t-clo-902.nameConfigmap" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-configmap
{{- end }}

{{- define "t-clo-902.nameSecret" -}}
{{ .Chart.Name }}-{{ .Release.Name }}-secret
{{- end }}

{{- define "imagePullSecret" }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}