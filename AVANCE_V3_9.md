# La Ribera de Ñuble Conecta — Avance técnico v3.9 (Android)

## Entregas verificadas

1. Corregido `compose.yaml`: producción ahora proporciona `TRUST_PROXY=true` y recordatorios automáticos, requisitos del servidor.
2. Nuevo `scripts/deployment-preflight.mjs` y comando `npm run check:deployment`: comprueba dominio, coincidencia de origen HTTPS, secreto de instalación, configuración parcial de VAPID y archivos esenciales sin imprimir credenciales.
3. Nuevo paso `npm run smoke` en el flujo GitHub Actions **antes** de compilar el APK. Comprueba endpoints públicos de salud y estado del servidor HTTPS.
4. La ruta de salud comprueba una consulta SQL real en lugar de devolver únicamente un texto fijo.
5. Validación de nombres de estudiantes: no se aceptan identificadores vacíos o solo espacios; el alta se incorpora al registro de auditoría.
6. Nuevas pruebas automatizadas para despliegue y validación de estudiantes. Se conservaron todas las pruebas previas.
7. Actualizada la comprobación de sintaxis del flujo de CI y la versión del paquete.

## Evidencia local

- `npm test`: 21 pruebas aprobadas (sin fallos).
- `node --check server/server.mjs` y `node --check www/app.js`: correctos.
- Integridad ZIP: comprobada.

## Bloqueos externos y riesgos restantes

- No hay APK compilado en esta entrega. El flujo GitHub Actions es un procedimiento de compilación, no prueba de instalación real.
- No existe dominio ni servidor HTTPS público aprovisionado en esta sesión; el chequeo remoto solo podrá pasar cuando estén disponibles.
- Web Push en un WebView Capacitor no equivale a Firebase Cloud Messaging nativo. No se ha verificado entrega con la app cerrada; no se debe prometer que funciona.
- Falta revisar permisos, retención, consentimiento y tratamiento de datos de estudiantes, además de pruebas en Android y restauración real de respaldos.

## Pasos para la primera prueba en Android

1. Desplegar `compose.https.yaml` con un dominio propio, `APP_DOMAIN` y `SETUP_SECRET` seguro; abrir 80 y 443 y configurar DNS.
2. Ejecutar `npm run check:deployment` con las variables de producción, y `APP_URL=https://tu-dominio.cl npm run smoke`.
3. Crear el establecimiento mediante la configuración inicial del servidor HTTPS.
4. Subir el proyecto a GitHub y ejecutar manualmente **Android APK de pruebas** con `app_url` igual al dominio HTTPS.
5. Descargar el artefacto APK del flujo y probar inicio de sesión, avisos, calendario y cierre de sesión en un teléfono Android.
6. No usar datos reales de estudiantes hasta completar revisión de seguridad y privacidad.

## Avance

Se conserva el **89 % orientativo**, pues los bloqueos principales de instalación y pruebas reales siguen pendientes. Este porcentaje no es una certificación de calidad ni una estimación de esfuerzo restante.
