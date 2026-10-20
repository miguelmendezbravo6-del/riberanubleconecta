# Avance técnico v4.3 — La Ribera de Ñuble Conecta

## Cambios implementados

1. **Vinculación masiva de apoderados**: `POST /api/guardians/bulk`, restringido a administradores. Admite entre 1 y 100 relaciones por lote. Antes de confirmar ofrece previsualización sin modificar datos. Verifica existencia y pertenencia a la escuela, roles titular/suplente, cuentas activas, duplicados y el límite de un apoderado de cada tipo por estudiante. La confirmación usa transacción SQLite y auditoría.
2. **Informe de cobertura**: `GET /api/admin/guardian-coverage`, restringido a administradores. Devuelve número de estudiantes por curso y cuántos tienen titular o suplente activo. No devuelve nombres, correos ni vínculos individuales.
3. **Interfaz administrativa**: formularios de vinculación por lote y consulta de cobertura en Gestión.
4. **Prueba integral adicional**: `tests/bulk-guardians.test.mjs`, con validaciones de autorización, previsualización, atomicidad, roles duplicados, reintentos idempotentes y cobertura.
5. **Versión de paquete**: 4.3.0.

## Verificaciones

- `node --check server/server.mjs`: correcto.
- `node --check www/app.js`: correcto.
- `npm test`: **26 de 26 pruebas satisfactorias**.
- Archivo ZIP: creado y verificado sin errores.

## Límites reales

No se ha compilado un APK Android en este entorno. No existe servidor HTTPS público ni dominio suministrado. Las notificaciones nativas con la app cerrada no han sido verificadas en un teléfono Android. Los tests no sustituyen una auditoría externa de seguridad y privacidad ni una prueba de carga. El código fuente no debe desplegarse con datos personales reales hasta validar los controles operacionales, consentimientos y permisos.

**Avance global estimado: 89 %**, sin cambios respecto de v4.2, porque siguen pendientes las pruebas críticas de despliegue y distribución.
