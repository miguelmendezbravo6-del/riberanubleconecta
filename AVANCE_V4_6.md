# La Ribera de Ñuble Conecta — avance v4.6

## Mejoras implementadas

- Instalaciones nuevas: diez niveles iniciales, desde Prekínder (NT1) y Kínder (NT2) hasta 8.º básico. Antes solo se creaban automáticamente los cursos 5.º a 8.º.
- Instalaciones existentes: endpoint administrativo `POST /api/admin/courses/complete` con previsualización y confirmación para completar niveles faltantes sin borrar matrículas, cursos o relaciones ya registradas.
- Apoderados con varios estudiantes: `GET /api/my/family-dashboard` reúne exclusivamente los estudiantes vinculados a la sesión, sus cursos, avisos no leídos por curso y cinco próximas actividades por curso.
- Panel de inicio de familias: tarjetas individuales de hijos/hijas, incluidos hermanos del mismo curso, y botones para entrar a las actividades de cada curso sin cambiar de cuenta.
- Panel administrativo: botón para completar el catálogo de niveles.
- Prueba de integración nueva: verifica diez niveles, tres hijos en dos cursos, hermanos en un mismo curso, privacidad entre familias y permisos administrativos.

## Comprobación local

- 30/30 pruebas automatizadas superadas.
- Sintaxis de servidor e interfaz verificada con `node --check`.
- Se conserva la base de código y los flujos previos; no se ha compilado ni probado un APK.

## Limitaciones importantes

- El APK requiere compilación Android real y un servidor HTTPS público configurado. La aplicación cerrada todavía no tiene notificaciones nativas FCM comprobadas.
- Las pruebas automatizadas no sustituyen pruebas en teléfonos ni auditoría independiente de seguridad y protección de datos.
- El catálogo automático crea un curso por nivel. Si hay secciones A/B, administración puede crear cursos adicionales.
- Los nombres antiguos o variantes de un mismo nivel no se fusionan automáticamente; se requiere revisión humana antes de introducir datos reales.
- Las cuentas tienen un rol de apoderado titular o suplente. La combinación de ambos roles en diferentes hijos aún requiere un diseño específico.

## Progreso

**89 % estimado**, mantenido porque aún faltan publicación HTTPS, APK, notificaciones nativas y pruebas reales.
