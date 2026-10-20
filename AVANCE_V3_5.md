# La Ribera de Ñuble Conecta — Android 3.5

## Cambios implementados y comprobados

1. **Corrección de compilación en GitHub Actions**: los flujos de pruebas y APK ya no usan `npm ci` ni la opción `cache: npm` sin `package-lock.json`, un error que impedía la instalación de dependencias en un repositorio nuevo. Ahora ejecutan `npm install --no-audit --no-fund`. Esta corrección está validada por prueba estática, **no por una compilación remota real**.
2. **Política de retención de avisos**: `GET /api/admin/notices/retention` informa cantidad de avisos leídos y pendientes; `POST /api/admin/notices/retention` permite una simulación (`{ "days": 90 }`) y requiere `confirm:true` para borrar exclusivamente avisos *leídos* con más de 90 a 3650 días.
3. **Separación de responsabilidades**: solo una cuenta administradora autenticada puede usar esta función. La depuración se limita a su establecimiento y registra el resultado en auditoría.
4. **Protección contra errores**: la interfaz ofrece una vista previa del número de registros elegibles, solicita confirmación explícita y conserva los avisos sin leer. No modifica actividades, consultas ni respuestas.
5. **Límite de frecuencia**: la operación de retención tiene un máximo de seis solicitudes por hora y cuenta/IP.
6. **Interfaz Android/web**: se incorporó un panel de retención responsable en Gestión, con opciones de 90, 180, 365 y 730 días.
7. **Pruebas ampliadas**: de 11 a 13 casos; nuevas pruebas ejecutan el servidor real con SQLite temporal, verifican simulación, límites, autenticación, borrado y conservación de avisos pendientes. Otra prueba comprueba la corrección de los flujos de GitHub.

## Resultado local

- `npm test`: **13/13** correctas.
- `node --check server/server.mjs` y `node --check www/app.js`: correctos.
- ZIP: integridad verificada.

## Obstáculos para producción

- **No se ha generado un APK en esta sesión**: la automatización de compilación está preparada pero requiere un repositorio GitHub, dependencias externas, el SDK Android y un servidor HTTPS publicado.
- No existe todavía un servidor público configurado ni un dominio real conectado.
- No están implementadas y probadas notificaciones **nativas FCM** con la app cerrada. Web Push no equivale a FCM nativo.
- Falta auditoría de seguridad, consentimiento y política de privacidad, pruebas reales de dispositivos, verificación de identidades y restauración de respaldos en infraestructura real.
- No ingresar datos personales reales de estudiantes o familias hasta resolver esos puntos.

## Compilación APK (cuando exista servidor HTTPS)

1. Publicar el proyecto en un repositorio privado de GitHub.
2. Configurar servidor y dominio HTTPS real según `compose.https.yaml`, sin subir `.env` ni bases de datos.
3. En **Actions → Android APK de pruebas → Run workflow**, escribir `https://dominio-real.cl`.
4. Descargar el artefacto `Ribera-Conecta-Android-APK-Pruebas` si la compilación termina satisfactoriamente.
5. Instalar solo en dispositivos de prueba, comprobar inicio de sesión, calendario, avisos, botón Atrás y comportamiento sin conexión.

**Nota:** el APK debug no es una versión firmada de producción; no debe distribuirse masivamente. El 88 % anterior era una estimación subjetiva; esta versión no demuestra un salto cuantificable en preparación real de despliegue.
