# La Ribera de Ñuble Conecta — solo Android (v2.2)

Esta edición elimina los pasos y dependencias específicos de iOS. La aplicación está preparada como proyecto Android con Capacitor, **no como APK ya compilado**.

## Compilar APK de prueba
1. Publicar el servidor en un dominio HTTPS seguro y comprobar que responde.
2. En un entorno con Node 22+, Android SDK y Java 21, ejecutar `npm install`, `npm test`, `APP_URL=https://tu-dominio.cl npm run configure:mobile`, `npm run check:release`, `npx cap add android`, `npx cap sync android` y `cd android && ./gradlew assembleDebug`.
3. El APK debug aparecerá en `android/app/build/outputs/apk/debug/`. También se puede ejecutar el flujo manual `.github/workflows/android-debug.yml` desde un repositorio GitHub con Actions.
4. Para distribuir oficialmente se necesita una compilación release firmada y pruebas en dispositivos Android reales.

## Importante
No se ha generado ni probado un APK en esta entrega. No utilizar datos reales de estudiantes o apoderados antes de completar publicación segura, verificación de identidad, política de privacidad, auditoría y pruebas de restauración. Las notificaciones nativas en segundo plano requieren integración Android específica; Web Push no equivale a FCM nativo.
