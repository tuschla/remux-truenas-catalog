{{- define "remux.workload" -}}
workload:
  remux:
    enabled: true
    primary: true
    type: Deployment
    podSpec:
      containers:
        remux:
          enabled: true
          primary: true
          imageSelector: image
          securityContext:
            runAsUser: 0
            runAsGroup: 0
            runAsNonRoot: false
            readOnlyRootFilesystem: false
          {{ with .Values.remuxConfig.additionalEnvs }}
          envList:
            {{ range $env := . }}
            - name: {{ $env.name }}
              value: {{ $env.value }}
            {{ end }}
          {{ end }}
          probes:
            liveness:
              enabled: true
              type: http
              port: 3000
              path: /
            readiness:
              enabled: true
              type: http
              port: 3000
              path: /
            startup:
              enabled: true
              type: http
              port: 3000
              path: /
{{- end -}}
