# Plan de puesta en marcha Android — La Ribera de Ñuble Conecta v4.0

## Qué se entrega
Código del servidor Node 22 / SQLite, interfaz móvil, configuración Capacitor Android, despliegue Docker+Caddy HTTPS, flujos GitHub Actions y pruebas automáticas. **No incluye APK ya compilado, dominio, servidor contratado ni credenciales de notificaciones**.

## Orden necesario para llegar a una aplicación instalable
1. Obtener un dominio HTTPS y un servidor Linux accesible por los puertos 80 y 443. No usar datos reales durante la puesta a punto.
2. Configurar `APP_DOMAIN`, `ALLOWED_ORIGIN=https://APP_DOMAIN`, `SETUP_SECRET` aleatorio largo y opcionalmente claves VAPID. Mantener los secretos fuera del repositorio.
3. Ejecutar `npm run check:deployment` y `docker compose -f compose.https.yaml up -d --build` en el servidor. Revisar logs, TLS y el resultado de `GET /api/health`.
4. Probar inicialización con administrador autorizado, inicio/cierre de sesión, docentes, titulares/suplentes, eventos, consultas, privacidad y copias de seguridad con cuentas ficticias.
5. Ejecutar manualmente `.github/workflows/android-debug.yml` con la URL pública HTTPS. Descargar el artefacto APK de pruebas y su archivo SHA-256.
6. Instalar el APK en Android, comprobar login, navegación, calendario, red lenta, cierre de sesión, notificaciones con la app abierta y cerrada. No prometer notificaciones nativas: la implementación actual es Web Push y su comportamiento en WebView debe validarse.
7. Antes de distribución real: decidir integración nativa FCM, auditoría externa, consentimiento informado, retención de datos, recuperación de cuenta, pruebas de restauración y aprobación del establecimiento.

## Qué se validó en v4.0
- Suite de 22 pruebas automáticas locales.
- Límite de intentos de inicio de sesión por identidad (15 intentos por ventana de 15 minutos), además del límite por IP.
- Máximo de 10 sesiones vigentes por cuenta tras nuevos inicios de sesión.

## Limitaciones que no se deben ocultar
- Los límites de intentos son en memoria y se reinician al reiniciar el servidor; una infraestructura con varias réplicas requerirá almacenamiento compartido.
- No existe un APK construido y probado en esta entrega.
- No se han verificado notificaciones nativas con la aplicación cerrada ni permisos de Android en dispositivos físicos.
- Un porcentaje de avance es solo una estimación; no equivale a seguridad certificada.
- No usar datos de menores hasta completar evaluación de privacidad, seguridad y operación institucional.
