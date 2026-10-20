# La Ribera de Ñuble Conecta — v4.2

## Cambios efectivos

1. **Matrícula masiva:** endpoint `POST /api/students/bulk`, solo para administradores. Acepta entre 1 y 100 identificadores por operación y exige un curso existente y autorizado.
2. **Vista previa:** el primer envío no escribe en SQLite. La confirmación explícita `confirm: true` efectúa todas las altas en una transacción; ante error se revierte.
3. **Control de calidad de datos:** rechaza identificadores vacíos o de más de 100 caracteres, duplicados dentro de la solicitud y duplicados ya registrados en el mismo curso, sin distinción de mayúsculas.
4. **Interfaz:** nuevo formulario de matrícula por lote en Gestión, con vista previa de cantidad y confirmación del administrador.
5. **Accesibilidad de la cuenta:** se corrigió el bloqueo que impedía acceder a Mi cuenta cuando un usuario aún no tenía cursos asociados. También se habilitó el centro de avisos sin curso asignado.
6. **Pruebas de integración:** caso nuevo con roles, previsualización, guardado, duplicados, límite de 100 y rechazo a apoderados.

## Comprobaciones

- `node --check server/server.mjs` y `node --check www/app.js`.
- `npm test`: 25 de 25 pruebas aprobadas.
- ZIP generado con integridad verificada.

## Límites y bloqueos

- La app Android **todavía no tiene APK generado ni instalado en un dispositivo**.
- El servidor HTTPS no se ha publicado; el dominio en `capacitor.config.json` es un marcador de posición.
- Web Push no demuestra funcionamiento de notificaciones nativas con Android cerrado.
- Antes de manejar datos reales de estudiantes, se requiere revisión legal y de seguridad, pruebas en dispositivos y respaldo/restauración en el entorno real.
- Los identificadores de estudiantes deben ser alias mínimos; no utilizar RUT ni datos sensibles para pruebas.

## Avance

**89 % orientativo, sin cambio.** No se debe interpretar como porcentaje certificado de producción. La meta de APK instalado y servidor público sigue pendiente.
