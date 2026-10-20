# La Ribera de Ñuble Conecta — avance Android 3.1

## Cambios reales de esta sesión
1. Exportación JSON administrativa con lista cerrada de datos (cursos, usuarios sin contraseñas, estudiantes, asignaciones y actividades); se registra en auditoría.
2. Descarga CSV desde Gestión, con aviso de confidencialidad y neutralización de fórmulas al abrir hojas de cálculo.
3. Paginación de avisos por cursor `before` y límite controlado, sin mezclar datos de usuarios.
4. Rechazo de solicitudes API desde orígenes web distintos al configurado cuando se presenta cabecera Origin.
5. Validación estricta de variables de entorno antes de iniciar en producción.
6. Verificador independiente de integridad y estructura de copias SQLite (`npm run backup:verify -- archivo.sqlite`).
7. Prueba de salud pública y configuración (`npm run smoke -- https://dominio`).
8. Plantilla de despliegue Docker Compose + Caddy con HTTPS automático, sujeto a DNS/servidor real.
9. Ampliación de pruebas de regresión sobre privacidad de exportación, paginación y respaldos.

## Publicación HTTPS (requiere servidor y dominio reales)
1. Crear registro DNS A/AAAA del dominio hacia el servidor.
2. Abrir puertos 80 y 443 y tener Docker/Compose instalados.
3. Copiar `.env.example` a `.env`; editar APP_DOMAIN y SETUP_SECRET con secreto aleatorio largo.
4. Ejecutar `docker compose -f compose.https.yaml up -d --build`.
5. Comprobar `APP_URL=https://tu-dominio npm run smoke`.
6. Configurar la app Android para esa URL usando `APP_URL=https://tu-dominio npm run configure:mobile` antes de compilar.
7. Configurar VAPID para Web Push solo tras verificar compatibilidad con dispositivos Android reales.

## Protección de respaldos
Generar con `DB_PATH=/ruta/datos.sqlite npm run backup -- /ruta/segura/respaldo.sqlite`, verificar con `npm run backup:verify -- /ruta/segura/respaldo.sqlite`. Probar restauración en ambiente de pruebas y mantener respaldos cifrados fuera del servidor. Nunca restaurar sobre una base activa.

## Límites reales
- No se ha generado ni probado APK; Android requiere compilación y prueba en un entorno con SDK.
- No se ha publicado servidor HTTPS; la plantilla no contrata alojamiento ni configura DNS.
- Web Push no equivale a notificaciones nativas FCM; deben probarse con la app cerrada.
- No existe auditoría independiente ni autorización institucional para almacenar datos reales.
- No se ha validado el uso masivo ni la entrega efectiva de notificaciones.

## Avance
**86 % estimado**: avance funcional y operativo, no porcentaje de tareas certificadas. El producto no está listo para distribuir a familias.
