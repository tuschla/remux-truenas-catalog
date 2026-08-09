{{- define "remux.persistence" -}}
persistence:
  data:
    enabled: true
    {{- include "ix.v1.common.app.storageOptions" (dict "storage" .Values.remuxStorage.data) | nindent 4 }}
    targetSelector:
      remux:
        remux:
          mountPath: /data
  {{- range $idx, $storage := .Values.remuxStorage.additionalStorages }}
  {{ printf "remux-%v:" (int $idx) }}
    enabled: true
    {{- include "ix.v1.common.app.storageOptions" (dict "storage" $storage) | nindent 4 }}
    targetSelector:
      remux:
        remux:
          mountPath: {{ $storage.mountPath }}
  {{- end }}
{{- end -}}
