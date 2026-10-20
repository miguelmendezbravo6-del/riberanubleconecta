# La Ribera de Ñuble Conecta — Android 4.1

## Entregado en esta sesión

- Diagnóstico administrativo de solo lectura (`GET /api/admin/diagnostics`): integridad SQLite `PRAGMA quick_check`, número de cuentas activas, sesiones activas/caducadas, avisos pendientes, última auditoría y estado de configuración Web Push. No revela secretos ni correos.
- Botón «Revisar estado del servidor» en Gestión. Presenta el resultado al administrador sin permitir a familias consultar esos datos.
- Traslado de estudiante: aviso interno a todos sus apoderados activos, tanto titular como suplente, indicando curso de origen y destino. Matrícula y avisos se escriben dentro de una única transacción; el envío Push se intenta después del commit.
- Endurecimiento de exportación iCalendar: normalización de saltos de línea CR/LF en textos ICS.
- Dos nuevas pruebas integrales que verifican permisos, privacidad, integridad y destinatarios.
- Caché estática PWA actualizada para refrescar recursos visuales.

## Pruebas

`npm test`: 24/24 satisfactorias en Node.js 22.

## Limitaciones críticas

El proyecto es código fuente. No se compiló APK, no se publicó servidor HTTPS, no se validó Web Push en Android con app cerrada ni se auditó la seguridad para uso real con datos de menores. El servidor necesita un dominio HTTPS real y secretos de producción. La compilación Android requiere un entorno con SDK Android, Gradle y las dependencias Capacitor, o ejecutar el flujo GitHub Actions existente.

## Entrega responsable

Usar datos ficticios para pruebas. No distribuir a familias hasta verificar cuentas, permisos, consentimientos, protección de datos, backups restaurables, notificaciones reales y comportamiento en celulares Android.
