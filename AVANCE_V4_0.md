# Avance v4.0 (sesión de seguridad y publicación)

**Base:** v3.9. **Destino:** exclusivamente Android.

### Cambios efectivos
1. Límite de intentos de login por cuenta, adicional al límite por IP.
2. Hash SHA-256 del correo usado para la clave del limitador, evitando almacenar el correo directamente en el mapa de intentos.
3. Limpieza de contadores vencidos.
4. Limpieza de sesiones expiradas al iniciar sesión.
5. Límite de 10 sesiones vigentes por cuenta; las anteriores se revocan.
6. Prueba automatizada de seguridad que verifica el límite de sesiones y la respuesta 429 tras intentos reiterados.
7. Plan ordenado de despliegue Android, instalación, pruebas reales y revisión de privacidad.

### Verificación
`npm test`: 22/22 aprobadas. No se generó APK ni se publicó servidor.

### Bloqueadores críticos
Dominio/servidor HTTPS público, compilación y prueba real del APK, notificaciones Android con app cerrada, auditoría de seguridad y privacidad antes de datos reales.

### Porcentaje
**89 % estimado, sin incremento**, pues los bloqueadores críticos continúan abiertos. El porcentaje no mide el tiempo restante.
