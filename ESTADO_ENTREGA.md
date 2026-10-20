# La Ribera de Ñuble Conecta — Android v2.6

## Cambios comprobables
- Indicador accesible de pérdida de conexión y recuperación del panel al restablecer la red.
- Mensajes más claros ante respuestas inválidas del servidor.
- Comportamiento de botón Atrás de Android preparado para volver al inicio del panel.
- Foco visible para navegación accesible por teclado.
- Documentación de la diferencia entre Web Push y notificaciones Android nativas.

## Límites actuales
- Este ZIP es **código fuente**, no un APK firmado.
- La infraestructura del servidor debe desplegarse bajo HTTPS y con copias de seguridad y controles de privacidad antes de usar datos reales.
- Web Push no equivale a Firebase Cloud Messaging en una aplicación nativa Capacitor; la recepción con la aplicación cerrada no está garantizada ni probada.
- El flujo de GitHub Actions para APK requiere un repositorio y una URL HTTPS del servidor, y su ejecución debe comprobarse.
- El proyecto no incorpora WhatsApp automático ni importación de miembros de grupos.

## Verificación local
Ejecutar `npm test` desde la carpeta raíz. Para instalar en Android se requiere compilar con Android SDK/Gradle; la compilación no ha sido comprobada en este entorno.
