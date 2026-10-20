# La Ribera de Ñuble Conecta — Android 3.6

## Cambios de esta sesión

1. Importación de hasta 30 actividades de calendario por lote, desde el panel de Actividades, mediante líneas con formato `AAAA-MM-DD | Tipo | Asignatura | Título | Detalle`.
2. Vista previa obligatoria en la interfaz antes de confirmar el lote. El servidor devuelve número de actividades, destinatarios y avisos previstos sin guardar datos.
3. Validación de fechas reales, tipos permitidos, asignaturas autorizadas y límites de longitud; bloqueo de actividades idénticas tanto dentro del lote como frente a actividades vigentes.
4. Transacción SQLite para la creación conjunta de actividades y sus avisos. Un fallo revierte todo el lote.
5. Avisos internos para apoderados y jefatura, con un intento de Web Push por destinatario después de confirmar la transacción.
6. Resumen por curso que informa cantidad de actividades, evaluaciones y próximas fechas; no expone identidades de familias. El total de avisos del curso solo está disponible para personal autorizado.
7. El inicio utiliza el conteo real de avisos pendientes del servidor y muestra próximas actividades ordenadas por fecha.
8. Los apoderados pueden consultar los estudiantes vinculados a su propia cuenta y curso, sin visualizar estudiantes de otras familias.
9. Flujo GitHub Actions Android reforzado: compilación Gradle sin daemon, verificación de integridad del APK, huella SHA-256 y conservación del artefacto durante 14 días. Requiere publicar previamente el servidor HTTPS.
10. Nueva prueba integral de carga masiva, permisos, atomicidad, duplicados, avisos, privacidad y estadísticas.

## Verificación

- `node --check server/server.mjs`
- `node --check www/app.js`
- `npm test` — 14 de 14 pruebas automatizadas correctas.
- ZIP de código fuente generado y comprobado.

## Limitaciones pendientes

- No hay servidor HTTPS público conectado, ni APK compilado en este entorno (faltan herramientas Android SDK/Gradle y configuración de dominio).
- No se ha verificado el flujo Android en GitHub Actions ni el funcionamiento en dispositivos físicos.
- Web Push no equivale a FCM nativo: no hay garantía de entrega cuando la APK está cerrada.
- Se requiere auditoría de privacidad, políticas de retención y pruebas de restauración en producción antes de cargar datos reales de estudiantes.

**Avance orientativo: 89 %**, sujeto a verificación real del despliegue y del APK. No es un porcentaje certificado.
