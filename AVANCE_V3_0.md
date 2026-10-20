# La Ribera de Ñuble Conecta — entrega Android 3.0

## Mejoras comprobadas
- Nuevo resumen administrativo: cuentas totales/activas, estudiantes, cursos, actividades vigentes, avisos sin leer y consultas privadas. Solo el rol administrador tiene acceso.
- La interfaz administrativa muestra estos indicadores sin revelar información privada a apoderados.
- Impide editar o volver a cancelar actividades ya canceladas; responde 409.
- Al cambiar la fecha de una evaluación, borra los registros de recordatorios anteriores para permitir programar los de la fecha nueva.
- Respaldo de SQLite consistente mediante la API `backup` de Node 22, verificación `PRAGMA integrity_check` y retención configurable (por defecto, 14 copias).
- Corregido también el script de respaldo antiguo que llamaba a un método no disponible en Node 22.
- Dos nuevas pruebas automatizadas; ahora cinco pruebas pasan.

## Comandos
`npm test` — ejecutar pruebas.
`npm run backup:rotate` — respaldo verificado, conservar últimas 14 copias.
`BACKUP_KEEP=30 BACKUP_DIR=/ruta/segura npm run backup:rotate` — personalizar retención.

## Automatización opcional en servidor Linux
Programar en crontab (ajustar directorios, usuario y permisos):
`0 2 * * * cd /srv/ribera-conecta && /usr/bin/npm run backup:rotate >> /var/log/ribera-backup.log 2>&1`

Mantener las copias fuera de carpetas públicas, con permisos restringidos, cifrado del almacenamiento y una copia externa. Probar restauraciones periódicamente. Este comando NO queda programado por sí solo.

## Límites reales
- No existe todavía un APK compilado y probado en un teléfono Android.
- No hay servidor HTTPS público configurado ni servicio push nativo FCM verificado.
- No se ha efectuado una auditoría externa de seguridad/privacidad ni validación operativa en la escuela.
- Los scripts de respaldo no sustituyen un plan de recuperación de desastres.

**Avance estimado: 85 %**, subjetivo y no equivalente a preparación para producción.
