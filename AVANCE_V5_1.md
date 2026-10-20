# Avance v5.1 — Integración real de credenciales del servidor FCM

## Problema resuelto
El servidor ya tenía un cliente FCM, pero el archivo `compose.https.yaml` no pasaba ninguna credencial a dicho cliente. El envío nativo quedaba deshabilitado en el despliegue estándar, aunque el APK pudiera compilarse.

## Cambios de código
- `server/fcm.mjs`: carga credenciales de cuenta de servicio desde archivo privado o JSON base64, con validación y exclusión mutua.
- `compose.https.yaml`: transmite `FCM_SERVICE_ACCOUNT_JSON_B64` al contenedor backend.
- `.env.example`: documenta la nueva variable de secreto.
- `scripts/audit-release.mjs`: reconoce ambas formas de configuración.
- `tests/fcm-deployment.test.mjs`: pruebas de lectura desde base64/archivo, incompatibilidad y errores.
- `GUIA_PUBLICACION_REAL_V5_1.md`: secuencia operativa real de servidor, Firebase, APK y pruebas de aceptación.

## Limitaciones
No hay servidor público, APK real ni credenciales de Firebase suministradas. La prueba FCM sigue siendo local/simulada; no prueba entrega al dispositivo. Se mantiene el alcance NT1 a 8.º básico y apoderados multicurso. El porcentaje global anterior (89 %) no es una medición reproducible; separar desarrollo probado y lanzamiento real.
