# La Ribera de Ñuble Conecta — v4.9

## Desarrollo efectivo

- Se agregó un canal **Firebase Cloud Messaging HTTP v1** para notificaciones Android nativas, además del Web Push anterior. Usa OAuth2 con JWT RS256 firmado desde la cuenta de servicio, sin enviar credenciales a la aplicación.
- Se incorporaron endpoints autenticados para registrar y eliminar el token FCM del dispositivo, con control de propiedad entre cuentas.
- Se incorporó el puente de Capacitor Push Notifications en la web y su dependencia nativa Android; el botón de notificaciones selecciona la vía nativa cuando corresponde.
- El servidor elimina tokens que FCM marca como inexistentes, respeta las preferencias de avisos y limpia tokens cuando se desactivan cuentas o se revocan sesiones en los flujos existentes.
- Se preparó el workflow Android para incorporar `google-services.json` desde un secreto de GitHub, sin subirlo al repositorio.
- Se corrigió la versión consignada en la información de compilación y se añadieron pruebas unitarias de autenticación y envío FCM simulado.

## Lo que NO se ha comprobado

**No se generó APK en este entorno**: no hay Android SDK/Gradle instalados ni acceso a los servicios externos para instalar dependencias. El workflow necesita ejecutarse en GitHub Actions con un dominio HTTPS público y dependencias disponibles.

**No se ha enviado una notificación FCM real**: se necesita proyecto Firebase, archivo Android `google-services.json`, credenciales de cuenta de servicio en el servidor y prueba física con un teléfono. Las pruebas actuales utilizan simulación de respuestas HTTP.

**No hay despliegue público HTTPS** ni prueba real de extremo a extremo. No usar datos personales reales de menores hasta verificar seguridad, autorización institucional y funcionamiento en producción.

## Configuración pendiente

1. Publicar servidor detrás de HTTPS y definir `APP_URL`, `ALLOWED_ORIGIN`, `SETUP_SECRET`.
2. Crear un proyecto Firebase, registrar el identificador Android `cl.riberadenuble.conecta`, habilitar Cloud Messaging API y crear cuenta de servicio restringida.
3. Configurar `FCM_SERVICE_ACCOUNT_FILE` en el servidor, apuntando a un archivo secreto fuera del repositorio.
4. Configurar en GitHub Actions el secreto `FIREBASE_GOOGLE_SERVICES_JSON_B64` (contenido de `google-services.json` codificado en base64).
5. Ejecutar el workflow `Android APK de pruebas`, descargar el APK y probar registro, recepción con app cerrada y revocación de permisos en teléfono real.

**Porcentaje**: no se puede acreditar un porcentaje global preciso. La funcionalidad de FCM está implementada en código, pero no validada en producción.
