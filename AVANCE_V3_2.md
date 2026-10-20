# La Ribera de Ñuble Conecta — Android v3.2

## Desarrollo verificado en esta sesión

1. **Creación de cursos desde Gestión:** el administrador puede abrir nuevos cursos (por ejemplo, para el año siguiente), con validación y rechazo de duplicados por establecimiento.
2. **Traslado de estudiantes:** el administrador puede mover un estudiante a otro curso sin borrar su cuenta ni los vínculos de apoderados titular y suplente. El acceso a cursos se calcula nuevamente a partir de la matrícula actual.
3. **Comunicados escolares:** el personal docente autorizado puede enviar un aviso general a su curso desde Actividades. El servidor crea notificaciones individuales para destinatarios autorizados, incluido el profesor jefe si corresponde, sin divulgar teléfonos o correos.
4. **Auditoría:** se registra creación de curso, traslado de estudiante y envío de comunicados.
5. **Privacidad y permisos:** apoderados no pueden crear cursos, trasladar estudiantes ni enviar comunicados docentes. El servidor valida permisos, no solo la interfaz.
6. **Centro de avisos:** opción para cargar mensajes antiguos en grupos de 25, aprovechando la paginación por cursor del servidor.
7. **Robustez de autenticación:** límite de longitud de contraseñas en login, alta de cuentas e instalación inicial, para evitar solicitudes desproporcionadas.
8. **Pruebas automatizadas:** prueba de flujo escolar integral que verifica creación, traslado, permisos, entrega de comunicado y registro administrativo.

## Pruebas

`npm test`: **7/7 satisfactorias** en Node.js 22.

`node --check server/server.mjs` y `node --check www/app.js`: sintaxis correcta.

Estas pruebas son locales y no sustituyen pruebas de carga, auditoría de seguridad ni pruebas en celulares Android reales.

## Limitaciones pendientes

- No existe un APK compilado o firmado en esta entrega.
- No hay servidor público ni dominio HTTPS configurado.
- Las notificaciones Web Push y su comportamiento con la aplicación cerrada no se han verificado en Android real; no se ha integrado FCM nativo.
- No hay prueba piloto institucional ni revisión legal de tratamiento de datos de estudiantes.
- El traslado cambia el curso actual del estudiante, pero no implementa un historial de matrículas por año académico.
- La comunicación se entrega a cuentas activas y vinculadas al curso. Se requiere verificar en terreno la recepción efectiva.

## Próximo hito real de cierre

Publicar servidor HTTPS de pruebas, compilar APK Android debug con SDK, instalarlo en al menos dos teléfonos de prueba, validar el flujo docente/apoderado, revisar privacidad y entrega de notificaciones. Solo después considerar publicación a familias.

**Avance estimado: 87 % funcional/operativo.** Porcentaje orientativo, no un indicador de tareas certificadas; la distribución real todavía está pendiente.
