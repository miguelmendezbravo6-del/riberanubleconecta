# Versión 5.0 — Seguridad de compilación y auditoría de publicación

## Cambios implementados

- `scripts/validate-firebase-android.mjs`: valida la estructura de `google-services.json`, el identificador del proyecto y que exista exactamente un cliente Android cuyo `package_name` coincida con `cl.riberadenuble.conecta`. Rechaza credenciales de otra aplicación.
- `scripts/enable-firebase-android.mjs`: valida Firebase antes de modificar Gradle.
- `.github/workflows/android-debug.yml`: ejecuta validación Firebase durante la compilación; evita imprimir el secreto base64 y elimina `google-services.json` del espacio de trabajo al finalizar.
- `scripts/audit-release.mjs`: auditoría local de archivos obligatorios, archivos privados, HTTPS, contenido mixto y prerrequisitos de publicación.
- `npm run check:audit` y `npm run check:firebase`.
- Dos nuevas pruebas automatizadas de validación Firebase y auditoría de publicación.

## Verificación

- `npm test`: **36/36 pruebas aprobadas**.
- `npm run check:audit`: **0 errores bloqueantes**, estado `NOT_READY` con cuatro advertencias: dominio HTTPS, APK, credenciales FCM y dominio público no configurados.
- No se ha generado un APK, ni se ha desplegado un servidor ni se han probado teléfonos reales. No se declara la aplicación lista para uso real.

## Próximo hito imprescindible

1. Configurar dominio HTTPS propio y servidor público con backups.
2. Crear proyecto Firebase Android para `cl.riberadenuble.conecta` y configurar las credenciales por secretos.
3. Ejecutar workflow Android en GitHub Actions y descargar el APK generado.
4. Instalar y probar en teléfonos reales, incluida la recepción de avisos con la app cerrada y los permisos de familias.

## Alcance

Prekínder (NT1), Kínder (NT2) y 1.º a 8.º básico. Una sola cuenta por apoderado con estudiantes de varios cursos y vínculos titular/suplente por estudiante.

El porcentaje global anterior de 89 % era orientativo, no una métrica verificada. Esta entrega conserva la distinción entre desarrollo de código y preparación de producción.
