# La Ribera de Ñuble Conecta — v4.7

## Avance real de esta sesión

- Corregida la restricción que obligaba a que una cuenta de apoderado tuviera siempre el mismo tipo de vínculo para todos sus estudiantes. El rol de cuenta continúa siendo titular o suplente para controlar el acceso, pero el tipo de responsabilidad es **por estudiante**.
- El administrador puede indicar `kind: titular` o `kind: suplente` en `POST /api/guardian` y en cada fila de `POST /api/guardians/bulk`. Si omite `kind`, se conserva el comportamiento anterior por compatibilidad.
- Interfaz administrativa actualizada con selector de tipo de vínculo para alta individual.
- Importación masiva admite `ID estudiante | ID apoderado | titular/suplente`, y conserva el formato antiguo de dos columnas.
- Se impide registrar dos titulares o dos suplentes distintos para un estudiante, y se impide asignar a una misma persona ambos tipos para el **mismo** estudiante. La validación se aplica también dentro de un lote antes de escribir en SQLite.
- La consulta `/api/my/students` ya devuelve el tipo real de vínculo por estudiante y la vista de familias multicurso puede mostrarlo.
- Nueva prueba integral con apoderada titular de un estudiante y suplente de otro, cursos diferentes, prohibición de duplicados, bloqueo a otros usuarios y atomicidad de lotes.

## Verificación

- `node --check server/server.mjs` y `node --check www/app.js`.
- `npm test`: **31/31** pruebas satisfactorias en Node.js 22.
- Integridad ZIP verificada.

## Estado honesto de publicación

**Avance orientativo global: 89 %.** No se incrementa por mejoras de negocio mientras no exista APK probado, servidor HTTPS público, integración nativa de notificaciones en segundo plano y pruebas de privacidad/seguridad en teléfonos reales. Este ZIP contiene el código fuente, no un APK. No utilizar datos reales de menores antes de la validación final.

## Requisito de producto

Cursos desde **Prekínder (NT1) hasta 8.º básico**, con una cuenta por apoderado aunque tenga varios estudiantes en uno o más cursos, y responsabilidad titular/suplente determinada individualmente para cada estudiante.
