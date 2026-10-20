# Avance 4.8 — calendario familiar y cambio seguro de responsabilidad

## Implementado

1. `GET /api/my/family-calendar?from=AAAA-MM-DD&to=AAAA-MM-DD`: agenda agregada de cursos con estudiantes efectivamente vinculados al apoderado autenticado. Sin detalles de otros estudiantes. Rango máximo de 93 días, 500 eventos por respuesta y verificación de fechas.
2. Calendario visual de la cuenta familiar: reúne eventos de todos los cursos vinculados e identifica cada evento por su curso. Los demás perfiles mantienen el calendario de curso.
3. `PATCH /api/guardian/role`: administración cambia titular/suplente en un vínculo existente sin borrarlo y sin exponer un intervalo de pérdida de acceso. Valida escuela, cuenta activa, vínculo existente y responsabilidad disponible. Audita los cambios.
4. Formulario administrativo para cambios de responsabilidad con confirmación explícita.
5. Prueba de integración con tres cursos, dos familias, privacidad, fechas inválidas, restricciones por rol y conflictos.
6. Versión 4.8.0 y caché PWA actualizado.

## Verificación

`npm test`: 32/32 pruebas aprobadas. `node --check` del backend y frontend: correcto. No se construyó APK; no se desplegó servidor público ni se probaron notificaciones nativas en dispositivos.

## Pendientes críticos

Compilación de APK Android real; HTTPS público; credenciales VAPID/FCM y verificación de avisos con app cerrada; pruebas en teléfonos reales; revisión de protección de datos personales y autorización institucional. El 89% global informado anteriormente es solo orientativo, no una medición verificable de producción.
