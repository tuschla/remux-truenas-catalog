{{- define "remux.service" -}}
service:
  remux:
    enabled: true
    primary: true
    type: NodePort
    targetSelector: remux
    ports:
      webui:
        enabled: true
        primary: true
        port: 8096
        nodePort: {{ .Values.remuxNetwork.webPort }}
        targetPort: 3000
        targetSelector: remux
{{- end -}}
