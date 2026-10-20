# La Ribera de Ñuble Conecta v5.2 — Compilación Android desacoplada del despliegue

## Cambio principal
El flujo anterior obligaba a que el servidor HTTPS ya estuviera operativo antes de compilar un APK. Esto impedía obtener un APK de prueba para preparar el lanzamiento. Ahora el parámetro `verify_live_server` permite decidir si se ejecuta la comprobación remota. **La URL HTTPS sigue siendo obligatoria y se incorpora al APK, pero no es necesario que esté publicada en el momento de compilar.**

## Procedimiento
1. Crear repositorio privado GitHub con el código, sin `.env`, bases de datos ni credenciales.
2. Abrir Actions → Android APK de pruebas → Run workflow.
3. Escribir en `app_url` la URL HTTPS definitiva prevista, por ejemplo `https://conecta.tudominio.cl` (reemplazar por la real).
4. Dejar `verify_live_server=false` para compilar antes del despliegue. Si el servidor ya funciona, activarlo.
5. Configurar el secreto opcional `FIREBASE_GOOGLE_SERVICES_JSON_B64` para notificaciones nativas; sin él se compila el APK, pero no funciona FCM.
6. Descargar el artefacto `Ribera-Conecta-Android-APK-Pruebas` de la ejecución exitosa.
7. Publicar el servidor y verificar `npm run smoke` contra la misma URL; instalar el APK en un Android real y comprobar acceso, avisos, roles y notificaciones.

## Comprobaciones
- Nuevo `npm run check:android-build` valida URL, configuración segura y ausencia de `google-services.json` en el árbol.
- Prueba automatizada para URL de ejemplo, URL HTTPS válida y presencia de secretos.
- No se ha compilado ningún APK aquí, no hay dominio configurado ni se han ejecutado pruebas en Android real.
