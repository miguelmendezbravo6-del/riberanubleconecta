# Avance Android 3.3 — ampliación funcional y operativa

## Entregado y comprobable

- Exportación de datos de la propia cuenta (`GET /api/account/export`): perfil, cursos autorizados, avisos propios, consultas y respuestas propias y aceptación de términos. Límite explícito de 5000 registros por categoría. Sin claves, sesiones ni información privada de otras cuentas.
- Botón **Descargar mis datos (JSON)** en la pestaña Mi cuenta.
- Al cerrar sesión, intento de desvinculación Web Push del dispositivo actual, además del cierre de sesión del servidor. En dispositivos sin soporte de Push, el cierre de sesión sigue funcionando.
- Restablecimiento/cambio de contraseña y cierre global de sesiones también revocan suscripciones Web Push asociadas a la cuenta, evitando notificaciones a dispositivos anteriormente autorizados.
- Servicio de respaldo automático separado en Docker Compose HTTPS, con volumen persistente independiente para copias y retención configurable.
- Nuevas pruebas de aislamiento de exportaciones y revocación de sesiones.

## Advertencias importantes

- El ZIP contiene **código fuente**, no APK.
- Web Push dentro de Capacitor no equivale a Firebase Cloud Messaging nativo. No se certifican avisos con la app cerrada.
- Un servidor HTTPS, un dominio real, compilación con Android SDK y pruebas en teléfonos reales siguen pendientes.
- Los respaldos requieren cifrado, custodia fuera del servidor y ensayos de restauración antes de producción.
- La exportación individual está limitada a 5000 registros por colección; no se anuncia como exportación legal exhaustiva.

- Imagen Docker corregida para incluir los scripts operativos y las dependencias de Web Push en despliegues con red, además de preparar permisos del directorio de respaldos. No se ha construido la imagen en esta sesión.
