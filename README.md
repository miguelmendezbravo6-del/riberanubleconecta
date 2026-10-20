> Versión 4.4: preferencias Web Push por cuenta y verificación ampliada de publicación. Consultar `AVANCE_V4_4.md` y `PASOS_CONCRETOS_APK.md`.

# La Ribera de Ñuble Conecta — versión 1.3

Aplicación escolar con backend Node.js y SQLite, control de acceso por establecimiento/curso, calendario, avisos internos y muro privado/general. Interfaz en español, móvil y escritorio.

## Ejecutar

Requiere Node.js 22.13 o posterior. Ejecuta `npm start` en la carpeta del proyecto. Abre `http://localhost:3000`. En el primer acceso crea la cuenta administradora con contraseña de 12 caracteres como mínimo. El servidor guarda los datos en `server/ribera.sqlite` (no incluido en el ZIP). Para pruebas locales no se requiere instalar paquetes npm.

## Configurar el colegio

El administrador crea cuentas docentes y de apoderados, las autoriza, asigna profesores a cursos, registra estudiantes y vincula apoderados titulares o suplentes. Las notificaciones internas de nuevas evaluaciones, cambios y cancelaciones se generan para los apoderados vinculados y el profesor jefe del curso. Los números telefónicos no se solicitan ni muestran.

## Android e iPhone

El proyecto contiene la configuración de Capacitor, pero **NO incluye un APK ni un IPA compilado**. Antes de empaquetar se debe desplegar el backend en un servidor HTTPS, sustituir `REEMPLAZAR-CON-TU-DOMINIO-HTTPS` en `capacitor.config.json` por el dominio real y configurar almacenamiento persistente y copias de seguridad. Luego instalar dependencias (`npm install`), generar los proyectos con `npx cap add android` y `npx cap add ios`, sincronizar (`npm run sync`) y compilar con Android Studio o Xcode. iOS requiere macOS/Xcode y aprovisionamiento Apple. No publicar con el dominio de ejemplo.

## Seguridad y límites antes de uso real

La API valida permisos del lado servidor; las sesiones expiran a los 7 días; las claves se derivan con scrypt. Aun así, antes de producción se requiere revisión de seguridad, TLS/HTTPS, rate limiting, recuperación segura de cuentas, consentimiento y política de privacidad, gestión de retención/eliminación de datos, respaldo cifrado, monitoreo, protección contra abuso y pruebas con usuarios. Las consultas privadas están limitadas a autor, destinatario y administrador autorizado. El administrador puede acceder a ellas por su rol: informar esto en la política de privacidad.

**No** incluye WhatsApp, push externo, SMS, extracción de contactos, correo saliente, registro autónomo de familias, despliegue público ni pagos. No usar información real de menores hasta completar las medidas legales y técnicas.


## Mejoras de versión 1.1

- Control de intentos de inicio de sesión y configuración inicial por dirección IP (en memoria, requiere protección adicional en producción).
- Los profesores de asignatura solo pueden crear actividades de materias asignadas por administración.
- Cambio de contraseña con invalidación de sesiones anteriores; endpoint para cerrar todas las sesiones.
- Validación de correo/nombre y rechazo de respuestas vacías.
- Encabezados de seguridad adicionales para el contenido web.
- Prueba de integración automatizada: `npm test` (autenticación, acceso a cursos, restricciones por asignatura, avisos, privacidad de consultas y cambio de contraseña).
- Copia de seguridad manual de SQLite: `npm run backup`. Resguardar la copia fuera del servidor y cifrarla para datos reales.

**Estado de entrega:** fuente funcional local para evaluación técnica, no producto certificado ni instalador. No incluye push remoto, integración de WhatsApp, publicación HTTPS, APK o IPA. No utilizar datos reales de menores antes de completar seguridad, consentimiento, recuperación de cuentas y despliegue seguro.

## Actualización 1.2 — calendario y recordatorios

- Al programar una evaluación, la interfaz consulta `GET /api/conflicts?course=ID&date=AAAA-MM-DD` y advierte de evaluaciones coincidentes del mismo curso. Es una advertencia, no un bloqueo.
- Administradores pueden ejecutar `POST /api/reminders/run` para generar avisos internos 3 y 1 día antes de evaluaciones; los envíos repetidos para la misma evaluación y anticipación se deduplican en SQLite. No se ejecuta automáticamente por sí solo: falta configurar un proceso diario confiable.
- `GET /api/calendar.ics?course=ID` devuelve los datos del calendario en JSON autenticado para una futura exportación iCalendar; **todavía no devuelve un archivo ICS**.
- Los recordatorios no son notificaciones push del sistema operativo ni mensajes de WhatsApp.
- Pruebas: `npm test`.

**Pendientes críticos:** despliegue HTTPS, copias de seguridad externas y cifradas, revisión de seguridad, recuperación de cuentas, verificación de apoderados y consentimiento, servicio push, compilación APK/iOS y pruebas de instalación. No introducir datos reales de estudiantes hasta completar estas tareas.

## Actualización 1.3 — calendario interoperable

- `GET /api/calendar.ics?course=ID` genera ahora un archivo iCalendar (`text/calendar`) descargable, con eventos de día completo, fechas, título y descripción. El endpoint exige autenticación y autorización sobre el curso.
- Prueba automatizada adicional verifica el formato ICS y denegación de acceso a usuarios ajenos al curso.
- **No se ha completado la compilación Android/iOS ni el despliegue HTTPS**. Las notificaciones siguen siendo internas, no push ni WhatsApp.

## Versión 1.4 — recordatorios automáticos

El servidor ahora ejecuta la generación de recordatorios al iniciar (tras 3 segundos) y cada hora mientras permanezca encendido. Usa la fecha de `America/Santiago`, avisa 3 y 1 día antes de evaluaciones activas y evita duplicados persistentes con la tabla `reminders`. Para desactivarlo, definir `AUTO_REMINDERS=false`. Si el servidor está apagado, no se generan avisos hasta que vuelva a iniciarse; se necesita alojamiento siempre activo para una operación continua. **Estos avisos siguen siendo internos: no son push ni WhatsApp.**

No se ha completado publicación HTTPS, auditoría independiente, distribución Android/iOS ni instalación en teléfonos. Esta versión es una mejora verificable del código fuente, no una entrega definitiva lista para familias.

## Versión 1.5 — seguridad y empaquetado de servidor

- Se añadieron límites de frecuencia para publicaciones, respuestas y creación de cuentas (en memoria; no reemplazan un control distribuido).
- En modo `NODE_ENV=production`, el alta inicial requiere un `SETUP_SECRET` de al menos 24 caracteres enviado en cabecera `X-Setup-Secret`; el formulario web inicial no lo envía. **Inicializar primero en un entorno local seguro** y migrar la base de datos protegida al volumen persistente, o utilizar un cliente HTTP seguro para la instalación inicial. No publicar el servicio sin terminar la instalación y configuración.
- Se incluyeron `Dockerfile` y `compose.yaml` para despliegue detrás de un proxy HTTPS; el puerto del contenedor solo se expone a localhost del anfitrión. No hay TLS integrado: el operador debe configurar el proxy, certificados, firewall, backups externos cifrados y actualizaciones.
- `HOST` permite configurar la interfaz de escucha (por defecto 127.0.0.1 para desarrollo; en contenedor 0.0.0.0).
- Pruebas automatizadas: `npm test`.

**Limitaciones aún críticas:** no hay push de Android/iOS ni mensajes WhatsApp; no se generaron APK/IPA; no hay publicación HTTPS, sistema de recuperación de contraseñas, invitaciones con verificación de identidad, gestión de consentimientos ni auditoría externa de seguridad. Esta versión sigue siendo una entrega de código fuente y **no es apta para datos reales de menores** sin completar esos puntos.

## Versión 1.6 — controles de administración y privacidad (20-10-2026)

- Nuevos endpoints `DELETE /api/assign` y `DELETE /api/guardian` para revocar asignaciones docentes y vínculos de apoderados, limitados al administrador del mismo establecimiento. Los permisos de acceso se recalculan en cada solicitud.
- El autor de una consulta o un administrador pueden eliminar una consulta y sus respuestas mediante `DELETE /api/posts/:id`; otros docentes y apoderados no pueden hacerlo.
- `GET /api/notices/unread` devuelve el número de avisos pendientes del usuario autenticado.
- `GET /api/consent` y `POST /api/consent` permiten consultar y registrar aceptación explícita de la versión de condiciones 2026-10. **No equivale a una política de privacidad validada legalmente**, ni sustituye la verificación de identidad y autorización de representantes.
- Se agregaron índices para acelerar consultas frecuentes, y una política restrictiva de permisos del navegador.
- Se impide que un profesor de asignatura edite una evaluación propia después de perder su autorización para esa asignatura.
- Se ampliaron las pruebas automatizadas para consultar avisos pendientes, aceptar condiciones, impedir borrado de consultas ajenas y comprobar borrado autorizado.

**Limitaciones reales:** estas rutas de administración todavía necesitan controles de interfaz específicos. No hay notificaciones push remotas, ni WhatsApp automático, ni APK/IPA firmados. La app debe alojarse con HTTPS y someterse a auditoría, gestión de consentimiento y pruebas en teléfonos antes de incorporar datos personales reales. `npm test` ejecuta la prueba de integración incluida.

## Versión 1.7 — gestión operativa y cuenta

- Panel administrador con listado y revocación de asignaciones docentes, y listado y desvinculación de apoderados, con comprobación de establecimiento en servidor.
- Panel Mi cuenta para cambiar contraseña y cerrar sesiones.
- Eliminación de consultas por autor o administrador desde la interfaz.
- Exportación ICS desde la pantalla de calendario mediante descarga autenticada.
- API de lectura de asignaciones y vínculos limitada al administrador.
- **No es una aplicación definitiva publicada**: falta servidor HTTPS real, auditoría de seguridad, push móvil, compilación APK/IPA, aprovisionamiento Apple y pruebas de dispositivos. No usar datos reales de menores todavía.

## Versión 1.8 — cierre de sesiones y avisos en pantalla

- Desactivar un usuario invalida sus sesiones inmediatamente; no basta con ocultarlo en la interfaz.
- Un administrador no puede desactivar su propia cuenta; se evita dejar al establecimiento sin administradores activos.
- El cliente consulta los avisos no leídos cada 45 segundos **solo mientras está abierto y visible** y muestra un aviso cuando detecta nuevos. No es push del sistema operativo ni funciona con la app cerrada.
- Se agregaron pruebas de regresión de desactivación de cuentas y cierre de sesiones.

**Bloqueos para producción:** falta HTTPS público, recuperación de cuenta, respaldo seguro verificado, auditoría independiente, compilaciones móviles firmadas y push en segundo plano. No introducir datos personales reales hasta resolverlos.

## Versión 1.9 — comunicación bidireccional y recuperación administrada

- Nuevas consultas privadas generan avisos internos al docente destinatario; consultas generales generan avisos a docentes asignados al curso.
- Las respuestas generan un aviso al autor de la consulta y, en consultas privadas, al docente destinatario cuando corresponde. Los avisos no incluyen el contenido privado.
- El administrador puede restablecer la contraseña de otra cuenta del mismo establecimiento, invalidando inmediatamente todas sus sesiones; se registra la acción en auditoría. La contraseña temporal se entrega fuera de la aplicación mediante un canal seguro.
- Opción para solicitar permiso de notificaciones del navegador, que puede mostrar alertas **solo mientras la aplicación permanece abierta y visible**. No sustituye notificaciones push en segundo plano.
- Pruebas de integración ampliadas para notificaciones del muro, privacidad y restablecimiento de credenciales.

**Estado real:** proyecto fuente local, NO APK/IPA, NO publicación pública, NO push en segundo plano. Falta auditoría independiente, verificación de apoderados, políticas de datos, copias de seguridad probadas y alojamiento HTTPS. No usar información real de menores.

## Versión 2.0 — push web en segundo plano (implementación condicionada)

- Se incorporó registro autenticado de suscripciones Web Push por dispositivo y usuario, envío genérico sin datos privados, eliminación de suscripciones caducadas y revocación al desactivar cuentas.
- El service worker recibe eventos `push` y permite abrir la aplicación desde la notificación. Los avisos internos siguen funcionando sin esta configuración.
- Para habilitar: instalar dependencias (`npm install`), generar claves VAPID mediante `npx web-push generate-vapid-keys`, y configurar las variables de entorno `VAPID_PUBLIC_KEY`, `VAPID_PRIVATE_KEY` y `VAPID_SUBJECT` (ejemplo: `mailto:soporte@dominio-propio.cl`). Guardar la clave privada fuera del repositorio. Publicar bajo HTTPS con certificado válido. El botón «Activar avisos del navegador» solicita permiso y registra el dispositivo.
- **Limitaciones**: no se ha validado el envío real contra servicios push externos, ni en teléfonos Android/iOS; en iPhone, Web Push exige una web app añadida a la pantalla de inicio en versiones compatibles. Las aplicaciones nativas Capacitor requieren integración específica de APNs/FCM y compilación. `npm test` cubre regresión local, no entrega push. Las notificaciones pueden retrasarse o fallar y no garantizan entrega.
- **No es producto definitivo**: faltan hosting público, dominio, HTTPS, auditoría de seguridad, respaldo externo cifrado probado, política de privacidad validada, identidad de apoderados verificada, compilación y distribución de apps nativas, pruebas reales de dispositivos y operación continua. No ingresar datos reales de menores antes de resolverlos.

## Edición Android 2.2
Se eliminó soporte iOS del proyecto. Consultar RELEASE_MOVIL.md para compilar Android.

## Actualización 3.0 — operación y administración
Se añadió resumen administrativo de indicadores, protección contra cambios en eventos cancelados, reinicio de recordatorios al reprogramar evaluaciones y respaldos SQLite verificados con rotación. Ejecutar `npm test` y `npm run backup:rotate`. Véase `AVANCE_V3_0.md`.

## Android 3.1 — operaciones y exportación
Se incorporó exportación CSV desde Gestión, con control administrativo y registro de auditoría. Hay paginación de avisos, validación de origen y variables de producción, comprobación de respaldos SQLite, prueba de salud y plantilla de despliegue HTTPS con Caddy. Leer `AVANCE_V3_1.md` para límites, seguridad y pasos de publicación.

## Actualización Android v3.2

Se incorporaron creación de cursos, traslado de estudiantes, comunicados internos por curso y carga de avisos históricos desde la interfaz. Consulta `AVANCE_V3_2.md` para pruebas y limitaciones. El ZIP es código fuente, **no** un APK. No ingresar datos reales de estudiantes antes de un despliegue HTTPS y revisión de seguridad institucional.

## Actualización 3.4 (Android)

Se añadió administración de sesiones propias, revocación remota, controles adicionales de seguridad, restauración segura de respaldos y pruebas continuas. Consultar `AVANCE_V3_4.md` para detalles y limitaciones. La distribución aún requiere APK compilado, servidor HTTPS y pruebas en Android.

## Actualización Android 3.5 — retención y preparación de APK

Se corrigió el bloqueo de los flujos de GitHub por ausencia de `package-lock.json` y se añadió un módulo administrativo de retención segura de avisos leídos con simulación previa y pruebas automatizadas. Véase `AVANCE_V3_5.md`. Sigue pendiente compilar un APK y verificarlo en teléfonos reales.

## Versión 3.7 (Android)

La pestaña **Agenda e informe** permite consultar actividades por intervalo de fechas. Los docentes autorizados también ven estadísticas por curso. El service worker almacena únicamente recursos públicos de la interfaz, nunca las respuestas de la API. Consulte `AVANCE_V3_7.md` para pruebas, limitaciones y pendientes de publicación.

## Actualización v3.8 — Recepción de comunicaciones

El panel de inicio muestra el estado de avisos pendientes del curso y, para docentes y administración, estadísticas agregadas de recepción de los últimos 30 días. La API incorpora `/api/notices/my-summary` y `/api/notices/course-summary`. Véase `AVANCE_V3_8.md` para pruebas, límites y tareas pendientes.


## v3.9 — publicación Android y seguridad operativa

Ver [AVANCE_V3_9.md](AVANCE_V3_9.md) y [GUIA_DESPLIEGUE_Y_APK.md](GUIA_DESPLIEGUE_Y_APK.md).

## Actualización 4.0 — Seguridad de acceso
Se incorporaron límites de intentos por cuenta y de sesiones activas, con pruebas específicas. Ver `AVANCE_V4_0.md` y `PLAN_PUESTA_EN_MARCHA_ANDROID.md`. La entrega sigue siendo código fuente y no incluye APK compilado.


## Versión 4.1 (Android)

Diagnóstico administrativo de solo lectura y notificación transaccional de traslados a titular y suplente. Ver `AVANCE_V4_1.md` y `PROXIMOS_PASOS_ANDROID.md`.


## Actualización v4.7

Vínculos familiares con tipo titular/suplente por estudiante (incluso para una misma cuenta), con importación masiva y pruebas de permisos. Ver `AVANCE_V4_7.md` y `GUIA_ROLES_FAMILIARES.md`.

## Novedades 4.9: notificaciones nativas Android

Se incluye integración FCM HTTP v1 y puente Capacitor Push Notifications, preparada para un despliegue real. Consultar `AVANCE_V4_9.md` para configuración, límites y requisitos de validación. No hay APK compilado ni entrega de notificaciones reales verificada.


## Versión 5.1: preparación de FCM para producción

Ver [AVANCE_V5_1.md](AVANCE_V5_1.md). Para push nativo utilizar `compose.fcm.yaml` junto a `compose.https.yaml`; la cuenta de servicio permanece fuera del repositorio.
