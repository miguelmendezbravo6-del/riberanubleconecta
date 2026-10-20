# Guía administrativa: vincular apoderados por lote

1. Ingresar como **administrador** y abrir **Gestión**.
2. Crear primero las cuentas de apoderados y registrar estudiantes; confirmar que los usuarios estén activos.
3. En **Vincular apoderados por lote**, introducir una relación por línea con el formato `ID_ESTUDIANTE | ID_USUARIO`. Ejemplo: `12 | 5`.
4. Pulsar **Revisar vínculos**. El servidor comprueba los datos y responde cuántos vínculos son nuevos y cuántos ya existían.
5. Confirmar solo tras revisar los identificadores. La operación se realiza en una transacción; si un vínculo no es válido, no se crea ninguno del lote.
6. Abrir **Cobertura de apoderados** y pulsar **Consultar cobertura** para verificar la cantidad de estudiantes con titular y suplente activos por curso.

**Reglas**: máximo 100 vínculos por operación. Un estudiante puede tener un titular y un suplente, pero no dos apoderados del mismo tipo. La importación no reemplaza apoderados existentes: se debe desvincular previamente a la persona anterior si corresponde. Evitar compartir identificadores de estudiantes y apoderados fuera del personal autorizado.
