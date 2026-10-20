# La Ribera de Ñuble Conecta — avance real v4.5

## Cambios incorporados

1. **Auditoría administrativa paginada**: `GET /api/admin/audit?limit=50&before=<id>` permite navegar hacia registros antiguos sin descargar todo el historial. Filtro exacto opcional `action=...`. Se valida el cursor y el tamaño máximo de página; acceso solo a administración.
2. **Resumen de auditoría**: `GET /api/admin/audit/summary` agrupa los tipos de acciones y muestra su volumen y última fecha. La interfaz incorpora un botón de resumen y otro para cargar registros anteriores.
3. **Diagnóstico de calidad de datos**: `GET /api/admin/data-quality` informa, por curso, cuántos estudiantes carecen de apoderado titular o suplente **activo**, número de asignaciones docentes activas y actividades con fecha pasada aún vigentes. No incluye nombres ni correos de alumnos o familias. Nuevo panel en Gestión.
4. **Compilación Android en GitHub Actions**: declaración explícita de SDK Android 35, build-tools y caché Gradle. El artefacto incluirá la huella SHA-256 y un archivo con URL y número de ejecución cuando la compilación se ejecute correctamente. No se ha compilado un APK en este entorno.
5. **Actualización de versión**: 4.5.0 y caché estática `ribera-static-v8`.
6. **Prueba integral nueva**: paginación, filtro, resumen, validación de entrada, calidad de datos, permisos de administrador y denegación a apoderados.

## Restricciones

No se ha desplegado servidor HTTPS público ni compilado un APK en esta sesión. La disponibilidad de notificaciones Web Push en Android nativo con la app cerrada continúa sin validarse. El flujo de compilación depende de un repositorio GitHub y de una URL HTTPS funcional. La información de estudiantes debe mantenerse fuera de un uso real hasta una auditoría y pruebas de dispositivos.

## Siguiente hito imprescindible

Publicar un servidor de pruebas con HTTPS, ejecutar el flujo GitHub Actions para producir un APK debug, instalarlo en teléfonos Android y verificar roles, autenticación, reconexión y notificaciones en segundo plano. Para notificaciones nativas confiables puede ser necesaria integración adicional con Firebase Cloud Messaging, aún no implementada.
