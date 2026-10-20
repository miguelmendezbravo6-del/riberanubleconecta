# Guía de despliegue y APK Android

## Requisitos

Servidor Linux con Docker y Docker Compose, dominio bajo control del establecimiento, puertos 80/443 accesibles, repositorio GitHub, teléfono Android de prueba. El proyecto no requiere iPhone.

## Servidor HTTPS

Crear un `.env` local con `APP_DOMAIN=app.tu-dominio.cl` y `SETUP_SECRET` aleatorio de 24 o más caracteres. Nunca publicar este archivo. Ejecutar:

```sh
export APP_DOMAIN=app.tu-dominio.cl
export ALLOWED_ORIGIN=https://app.tu-dominio.cl
export SETUP_SECRET='CAMBIAR-POR-UN-SECRETO-ALEATORIO-LARGO'
export NODE_ENV=production TRUST_PROXY=true
npm run check:deployment
# En el servidor, una vez que el DNS apunta a él:
docker compose -f compose.https.yaml up -d --build
APP_URL=https://app.tu-dominio.cl npm run smoke
```

La configuración de ejemplo del secreto debe reemplazarse por una clave realmente aleatoria. Los secretos no se deben incorporar al APK ni al repositorio.

## APK de prueba

En GitHub: Actions > **Android APK de pruebas** > Run workflow > ingresar `https://app.tu-dominio.cl`. El flujo valida el servidor, configura Capacitor, compila con Gradle y adjunta un APK de **depuración** con SHA-256 si todo pasa. Este APK no es un paquete de publicación firmado para Google Play.

## Límites de notificaciones

Los avisos internos funcionan dentro de la aplicación conectada. Las notificaciones push cuando la app está cerrada **no están garantizadas en la versión Capacitor/WebView**. Para un sistema escolar de producción se requiere integrar y probar FCM nativo con permisos Android 13+, registro y revocación de tokens, y controles de privacidad.

## Prueba de aceptación mínima

Usar cuentas y estudiantes ficticios. Verificar administrador, docente, apoderado titular y suplente; calendario, edición, comunicado, aviso recibido, privacidad del muro, revocación de acceso, cierre de sesión y restauración de respaldos. Solo después evaluar uso con datos reales.
