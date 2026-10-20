# La Ribera de Ñuble Conecta — Android 3.4

## Trabajo realizado

1. Gestión de sesiones por usuario: `GET /api/account/sessions` muestra solo sesiones propias, con identificador abreviado no reutilizable y caducidad.
2. Cierre de sesiones remotas: `POST /api/account/sessions/revoke-others` conserva la sesión actual y revoca las demás, además de eliminar suscripciones push de la cuenta por precaución.
3. Limpieza administrativa de sesiones expiradas: `POST /api/account/sessions/cleanup` solo para administrador.
4. Nueva tarjeta de sesiones en **Mi cuenta**, con botón para cerrar otras sesiones.
5. Validación reforzada de suscripciones Web Push y longitud de claves.
6. Cabeceras de seguridad y política de no almacenamiento para respuestas de la API.
7. Mayor validación de contraseña inicial.
8. Script de restauración **offline** con verificación de integridad, comprobación de tablas y claves foráneas, y rechazo de sobreescritura accidental.
9. Nueva prueba integral de seguridad de sesiones.
10. Nueva prueba de restauración y rechazo de sobrescritura.
11. Workflow de GitHub Actions para ejecutar pruebas en cada cambio.

## Pruebas y límites

- 11 pruebas locales automatizadas correctas con Node.js 22.
- Sintaxis de servidor, interfaz y restauración comprobada.
- Sin APK compilado en esta sesión.
- Sin servidor público HTTPS configurado, ni FCM/APNs ni prueba física de notificaciones Android con la app cerrada.
- No se ha realizado auditoría independiente ni validación de protección de datos personales de menores.

## Compilación Android (requiere cuenta/repositorio GitHub y dominio HTTPS real)

1. Publicar servidor en dominio HTTPS propio y configurar secretos de `.env`.
2. Configurar `APP_URL=https://dominio-real.cl` y ejecutar `npm run configure:mobile`.
3. Ejecutar `npm test` y `npm run check:release`.
4. Subir código a repositorio privado GitHub, abrir Actions y ejecutar workflow **Android APK de pruebas** con la URL HTTPS.
5. Descargar el artefacto APK de pruebas, instalarlo en un dispositivo Android autorizado y comprobar inicio de sesión, notificaciones y calendario.

**No subir datos de estudiantes, archivos .env, bases de datos o claves de firma al repositorio.**

## Recuperación segura

Detener los contenedores o servidor que utilicen SQLite, hacer copia de los archivos `.sqlite`, `.sqlite-wal`, `.sqlite-shm` y moverlos a un directorio seguro. Luego:

```bash
node scripts/restore-backup.mjs /ruta/respaldo.sqlite /ruta/destino-nuevo.sqlite --confirm-offline
```

El comando **rechaza** el destino si ya existe. No debe ejecutarse mientras el servidor escribe en el destino. La prueba automatizada verifica este comportamiento.

## Porcentaje

**88 % estimado**: sin aumento porque el despliegue real, APK, notificaciones nativas y revisión de seguridad siguen siendo bloqueos decisivos. La cifra no es una medida técnica certificada.
