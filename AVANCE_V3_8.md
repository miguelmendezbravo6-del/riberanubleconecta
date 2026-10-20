# Informe de desarrollo Android v3.8

## Cambios funcionales
- Nuevo endpoint autenticado `GET /api/notices/my-summary`: resume únicamente avisos de la propia cuenta agrupados por curso.
- Nuevo endpoint `GET /api/notices/course-summary?course=ID&days=30`: permite a docentes asignados y administradores conocer los avisos generados, leídos y pendientes de un curso, con ventana de 1 a 365 días.
- El panel de inicio muestra avisos pendientes del curso, avisos totales de la cuenta y, para personal autorizado, recepción agregada de comunicaciones.
- Las estadísticas docentes no exponen nombres de destinatarios, contenido de mensajes, teléfonos ni direcciones de correo.
- Nueva prueba integral: acceso permitido y denegado por rol, aislamiento entre cursos, validación de parámetros, marcado como leído y recálculo de estadísticas.

## Verificaciones ejecutadas
- `npm test`: 17/17 pruebas superadas.
- Validación de sintaxis de `server/server.mjs` y `www/app.js`.
- ZIP íntegro comprobado.

## Límites reales
- No se ha compilado ni instalado un APK en Android.
- No existe servidor HTTPS público desplegado en esta sesión.
- Las notificaciones Web Push no equivalen a notificaciones nativas garantizadas con la APK cerrada.
- El proyecto requiere pruebas de carga, privacidad, seguridad, restauración de respaldos y aceptación con usuarios reales antes de incorporar datos personales de estudiantes.
- El porcentaje de avance es una estimación de planificación y no una medida certificada.

## Ruta crítica
1. Conseguir un dominio y servidor HTTPS bajo control del establecimiento, con resguardo de datos.
2. Configurar `APP_URL` y ejecutar el flujo GitHub Actions de Android para generar un APK debug.
3. Instalar el APK en Android real y comprobar inicio de sesión, calendario, muro y permisos.
4. Implementar/verificar entrega de notificaciones en segundo plano con una solución nativa compatible y permisos apropiados.
5. Auditoría de seguridad, privacidad, respaldo y restauración; posteriormente generar APK de distribución firmado.
