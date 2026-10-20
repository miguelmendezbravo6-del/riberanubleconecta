# Cómo pasar del ZIP a un APK Android de prueba

El proyecto incluye `.github/workflows/android-debug.yml`, que puede generar un APK de pruebas mediante GitHub Actions.

1. Disponer de un servidor público con dominio propio y certificado HTTPS. En el ZIP se incluye `compose.https.yaml`, `Caddyfile`, `.env.example` y `GUIA_DESPLIEGUE_Y_APK.md` para configurar un servidor. **No subas claves reales ni datos personales al repositorio.**
2. Publicar el servidor y verificar desde un navegador `https://TU-DOMINIO/api/health` y `https://TU-DOMINIO/api/status`.
3. Crear un repositorio privado en GitHub y subir el contenido del ZIP (los archivos deben quedar en la raíz del repositorio, incluida la carpeta `.github`).
4. En GitHub, abrir **Actions → Android APK de pruebas → Run workflow**. Escribir `https://TU-DOMINIO` en el campo `app_url`.
5. El flujo instala dependencias, ejecuta pruebas, configura Capacitor, comprueba los seis recursos remotos y ejecuta Gradle para construir un APK de depuración.
6. Si termina correctamente, descargar el artefacto `Ribera-Conecta-Android-APK-Pruebas` desde la ejecución de Actions. Contiene APK y huella SHA-256.
7. Instalar únicamente en un dispositivo Android de pruebas sin datos personales reales. Verificar login, roles, consultas, calendario, aviso y cierre de sesión.

**Limitación importante:** este APK de pruebas carga el servidor remoto desde Capacitor. Sin servidor HTTPS accesible, no funcionará. Las notificaciones con la aplicación cerrada requieren trabajo nativo adicional; no se deben anunciar como operativas.
