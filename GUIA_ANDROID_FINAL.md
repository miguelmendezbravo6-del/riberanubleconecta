# La Ribera de Ñuble Conecta — Android 2.3

## Lo que se entrega
Código fuente de aplicación Android con Capacitor y backend Node/SQLite. **No es un APK compilado ni una instalación publicada.** La aplicación Android usa un servidor HTTPS remoto y necesita conexión a internet.

## Compilar un APK de pruebas
1. Publicar el backend en un dominio HTTPS con almacenamiento persistente, proxy seguro y copias de seguridad externas. No cargar datos reales antes de auditoría de privacidad y seguridad.
2. Crear repositorio GitHub privado con este proyecto (sin archivos `.env`, bases de datos ni claves).
3. Abrir Actions > Android APK de pruebas > Run workflow e indicar `app_url` como `https://dominio-del-servidor.cl`.
4. Al terminar, descargar el artefacto APK del workflow. Es un APK **debug para pruebas**, no versión de distribución firmada de producción.
5. Instalar en teléfono de pruebas y verificar login, cursos, calendario, consultas y avisos; probar también cambios de conexión.

## Instalación inicial segura
En producción configurar `SETUP_SECRET` de 24 caracteres o más, y `NODE_ENV=production`. La pantalla inicial solicita la clave de instalación para inicializar el colegio, pero no la almacena en el navegador. Cambiar las credenciales temporales después del alta.

## Notificaciones
Las notificaciones internas están implementadas. Web Push puede funcionar en navegadores compatibles si se configura VAPID, HTTPS y permisos. **No se garantiza push con la app Android cerrada:** requiere integración y pruebas de notificación nativa (p. ej. Firebase Cloud Messaging) antes de prometerlo. No hay WhatsApp automático.

## Antes de operar con familias
Auditar autorización de titulares/suplentes, verificación de identidad, permisos, política de privacidad, retención y borrado, respaldo cifrado y restauración, protección de servidores, certificados TLS y pruebas en varios teléfonos. La gratuidad del alojamiento no está garantizada.
