# La Ribera de Ñuble Conecta — Android v3.7

## Cambios verificables

1. Nuevo endpoint `/api/agenda` con intervalo válido de máximo 366 días, límite de resultados y permisos por curso.
2. Nuevo endpoint `/api/course/report`: estadísticas por tipo y asignatura, total de estudiantes y próximas actividades, sin nombres de estudiantes; acceso exclusivo a docentes asignados y administradores.
3. Nueva pestaña **Agenda e informe** para consultar ambos endpoints desde la interfaz Android/web.
4. Service worker mejorado: cachea recursos públicos de interfaz, excluye `/api/` y no almacena respuestas con datos personales. Permite abrir la interfaz sin conexión tras instalación previa; no permite consultar información escolar nueva sin internet.
5. Restricción del servidor de archivos estáticos mediante ruta canónica real: bloquea enlaces simbólicos fuera del directorio público.
6. Validación adicional de solicitudes: cuerpo JSON debe ser un objeto, no un array; se rechaza Content-Type no JSON cuando está presente.
7. Flujo de Android más restrictivo: permiso mínimo de lectura del repositorio y comprobación de archivos nativos tras sincronización.
8. Dos pruebas automatizadas nuevas, una integral de agenda/estadísticas/permisos y otra de protección de archivos privados.

## Validación local

- 16/16 pruebas automatizadas superadas.
- `node --check` de servidor e interfaz superado.
- APK **no compilado**: se necesita ejecutar el flujo de GitHub Actions con servidor HTTPS real.
- Notificaciones nativas con aplicación cerrada **no comprobadas**; Web Push no garantiza notificaciones en la app nativa Capacitor.
- Sin auditoría externa ni despliegue público.

## Estado y prioridades

Porcentaje de avance estimado: **89 %**, mantenido hasta resolver la instalación real. No es una métrica certificada.

Para entrega a usuarios finales faltan: dominio y servidor HTTPS con secretos de producción, compilar APK, probarlo en Android, implementar y validar push nativo (FCM), revisar tratamiento de datos de menores, recuperación de copias y pruebas de seguridad.

No utilizar datos personales reales de estudiantes hasta completar esas verificaciones.
