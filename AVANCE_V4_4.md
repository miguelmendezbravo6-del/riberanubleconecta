# Avance real v4.4 — 20 de octubre de 2026

## Entregables implementados

1. **Preferencias de notificaciones Web Push por usuario:** nueva tabla `notification_preferences`, API autenticada `GET/POST /api/account/notifications` y controles en «Mi cuenta». Solo admite booleanos. El servidor respeta la preferencia antes de enviar Web Push. Los avisos internos se siguen registrando para evitar perder comunicaciones escolares importantes.
2. **Aislamiento entre cuentas:** cada persona controla solo su propia preferencia, nunca la de otro usuario. La exportación de datos personales incluye esta preferencia.
3. **Prueba integral nueva de privacidad:** valida acceso autenticado, rechazo de tipos inválidos, persistencia, aislamiento entre cuentas y exportación.
4. **Prueba de publicación más profunda:** `scripts/smoke.mjs` comprueba seis recursos remotos: salud de la base de datos, estado de instalación, página principal, JavaScript de la app, service worker y manifiesto PWA. Rechaza HTTP público, rutas y credenciales. Se ejecuta antes de compilar el APK en GitHub Actions.
5. **Prueba integral del smoke:** arranca un servidor aislado, verifica los seis recursos y rechaza HTTP no local.
6. **Actualización del caché PWA:** versión `ribera-static-v7` para forzar renovación de recursos visuales al actualizar.

## Comprobaciones

- 28/28 pruebas automatizadas aprobadas (`npm test`).
- Sintaxis de `server/server.mjs`, `www/app.js` y `scripts/smoke.mjs` verificada.
- Integridad del archivo ZIP comprobada con `zipfile.testzip()`.

## Límites y bloqueos

- **APK no compilado:** este entorno no tiene Android SDK/Gradle ni acceso a npmjs.org para instalar las dependencias. El workflow de GitHub Actions puede compilarlo cuando se suba a un repositorio y se configure un servidor HTTPS público accesible.
- **Sin despliegue:** no hay dominio ni hosting HTTPS real conectado.
- **Notificaciones con app cerrada:** Web Push no demuestra funcionamiento en Android WebView; sigue pendiente una solución nativa FCM y pruebas con teléfonos reales.
- **Privacidad:** las pruebas no sustituyen una auditoría antes de tratar datos reales de estudiantes.

**Porcentaje de avance global: 89 % orientativo, sin aumento.** La versión 4.4 contiene mejoras verificadas, pero no se ha cumplido el hito de instalación real.
