# La Ribera de Ñuble Conecta — Android 2.4

## Cambios verificados

- Un estudiante puede tener un apoderado titular y uno suplente. La API rechaza vincular un segundo apoderado del mismo tipo hasta que el administrador revoque el anterior; se evita duplicar notificaciones por múltiples titulares accidentales.
- El panel de administración muestra el historial reciente de acciones registradas, con autor y fecha, sin exponer números telefónicos.
- El historial está restringido en servidor al rol administrador; se añadió una prueba que verifica el rechazo de un apoderado.
- La prueba de integración comprueba que el apoderado suplente recibe la notificación de una evaluación.

## Verificación

- `node --check` para servidor e interfaz: correcto.
- `npm test`: 3 pruebas automatizadas correctas, incluyendo nuevos casos de suplentes, límites de vínculos y acceso a auditoría.
- `npm run check:release`: **NO aprobado** por falta de un dominio HTTPS real. Este es un bloqueo previsto y no debe omitirse.

## Pendientes críticos

- Configurar servidor público HTTPS, dominio, almacenamiento persistente, respaldos externos cifrados y monitoreo.
- Compilar un APK con Android SDK/Gradle y probar instalación en dispositivos reales.
- Notificaciones nativas con aplicación cerrada: el Web Push disponible en navegador no garantiza entrega en APK Capacitor; integrar FCM con credenciales y permisos Android.
- Validación de identidad de apoderados, política de privacidad, retención y eliminación de datos, auditoría de seguridad independiente.
- Pruebas de carga, restauración de respaldo y aceptación por docentes y familias.

**No usar datos personales reales de menores ni distribuir como aplicación definitiva.** Este ZIP contiene código fuente, no un APK.
