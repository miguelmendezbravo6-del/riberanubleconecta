# Publicación real — La Ribera de Ñuble Conecta v5.1

## 1. Estado comprobado
El código y las pruebas automatizadas funcionan localmente. No se ha compilado aquí un APK Android, no se ha contratado/configurado un dominio, no se ha creado un proyecto Firebase real y no se han probado teléfonos reales. **No ingresar datos reales de menores antes de las pruebas y autorización institucional.**

## 2. Servidor HTTPS
Requisitos: servidor Linux con Docker y Docker Compose, dominio propio con DNS A/AAAA apuntando al servidor, puertos TCP 80 y 443 disponibles, y copias de seguridad fuera del servidor. Copiar `.env.example` a `.env` **solo en el servidor**. Configurar `APP_DOMAIN`, `SETUP_SECRET` aleatorio de al menos 32 caracteres y demás variables. Configurar `ALLOWED_ORIGIN=https://DOMINIO` y `NODE_ENV=production`, `TRUST_PROXY=true` al ejecutar el preflight local, que son valores fijados en compose. Ejecutar:

```sh
npm run check:deployment
# Cuando el DNS ya apunte al servidor:
docker compose --env-file .env -f compose.https.yaml up -d --build
docker compose -f compose.https.yaml ps
curl -fsS https://TU-DOMINIO/api/health
```

La verificación de HTTPS debe incluir certificado válido, rutas de aplicación, acceso desde internet y control de usuarios. Caddy obtiene certificados cuando DNS y puertos están correctamente configurados.

## 3. Firebase Android (dos configuraciones diferentes)
1. Crear un proyecto Firebase, registrar la aplicación Android con el `appId` exacto de `capacitor.config.json`, habilitar Cloud Messaging y obtener `google-services.json`.
2. En GitHub Actions, configurar el secreto `FIREBASE_GOOGLE_SERVICES_JSON_B64` con el archivo `google-services.json` codificado en base64. Este archivo configura **la aplicación Android**.
3. Crear una cuenta de servicio de Google con permisos limitados para Firebase Cloud Messaging HTTP v1. El JSON de cuenta de servicio es **distinto** de `google-services.json` y configura **el servidor**.
4. Para Docker, establecer `FCM_SERVICE_ACCOUNT_JSON_B64` en el `.env` del servidor, con el JSON de la cuenta de servicio codificado en base64. Base64 NO cifra: proteger el `.env`, no incluirlo en repositorios ni capturas. Alternativamente, usar `FCM_SERVICE_ACCOUNT_FILE` en un despliegue que monte el archivo de forma privada (no se monta automáticamente en el compose incluido).
5. Verificar permisos de la cuenta de servicio y rotación de credenciales. El servidor no enviará push nativo si no hay configuración válida.

## 4. APK Android
Subir el proyecto a un repositorio GitHub privado. Ejecutar manualmente el flujo **Android APK de pruebas** indicando `app_url=https://TU-DOMINIO`. El flujo comprueba el servidor publicado, valida la configuración Firebase si se proporcionó y compila el APK debug. Descargar el artefacto y comprobar su SHA-256. Este paso requiere internet y el SDK Android de GitHub Actions; no se ha ejecutado en este entorno.

## 5. Pruebas de aceptación con datos ficticios
- Instalar APK en al menos dos teléfonos Android de distintas versiones.
- Iniciar sesión como administración, docente y apoderado.
- Crear cursos NT1, NT2 y 1.º a 8.º básico; validar permisos por curso.
- Vincular dos hijos en cursos diferentes, dos hermanos en el mismo curso, titular y suplente.
- Publicar comunicación y comprobar entrega de notificación con app abierta, en segundo plano y cerrada; verificar preferencias de usuario.
- Probar revocación de sesión, acceso denegado a otra familia y recuperación de respaldo en entorno aislado.
- Probar con internet lento, pérdida de conexión y reinicio del teléfono.
- Documentar resultados, fecha, modelo de teléfono, versión Android, evidencia y responsable institucional.

## 6. Decisión de lanzamiento
No declarar «lista para producción» hasta que se complete la matriz anterior, una revisión de privacidad de datos de menores y una restauración real de respaldo. El APK debug sirve para pruebas, no para distribución definitiva en producción.
