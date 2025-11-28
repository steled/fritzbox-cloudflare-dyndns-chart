{{/* Common labels */}}
{{- define "fritzbox-cloudflare-dyndns-chart.labels" -}}
app.kubernetes.io/name: {{ include "fritzbox-cloudflare-dyndns-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "fritzbox-cloudflare-dyndns-chart.name" -}}
{{ .Chart.Name }}
{{- end -}}
