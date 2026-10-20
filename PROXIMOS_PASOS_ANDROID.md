# Ruta crítica para instalar en Android

1. Contratar o disponer de servidor Linux accesible y dominio propio; definir HTTPS válido.
2. Configurar `SETUP_SECRET`, `ALLOWED_ORIGIN`, `TRUST_PROXY=true`, ruta de SQLite persistente, respaldos fuera del servidor y VAPID si se usará Web Push. Revisar `.env.example`, `GUIA_DESPLIEGUE_Y_APK.md` y `scripts/deployment-preflight.mjs`.
3. Ejecutar `npm test`, `npm run check:deployment`, publicar servidor, comprobar `https://DOMINIO/api/health` y `npm run smoke` con `APP_URL` configurada.
4. En GitHub Actions, ejecutar manualmente «Android APK de pruebas» indicando la URL HTTPS exacta. El flujo instala dependencias, configura Capacitor, comprueba el servidor y compila un APK debug. Descargar el artefacto solo si la ejecución concluye satisfactoriamente.
5. Instalar el APK debug en un dispositivo de pruebas sin datos personales reales; comprobar login, asignaciones, calendario, titular/suplente, avisos, consultas, desconexión, cambio de contraseña y cierre de sesión.
6. Verificar notificaciones cuando la aplicación está cerrada. La solución Web Push existente no equivale a una implementación garantizada de FCM nativo en Android; puede requerirse plugin nativo y credenciales Firebase.
7. Hacer revisión independiente de seguridad, políticas de datos, recuperación y consentimiento; solo después preparar APK firmado de distribución.

No afirmar que hay APK disponible hasta que exista y se haya probado. No incrustar secretos de servidor en la aplicación móvil.
