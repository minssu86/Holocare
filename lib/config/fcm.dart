import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:holocare/providers/user_provider.dart';

void configureFirebaseMessaging(UserProvider provider) async {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  print(await firebaseMessaging.getToken(
      vapidKey: "Qhln6dEshV32n-q5O_tLSsbloq65vB5SeXnGlASrvW8"));

  firebaseMessaging.requestPermission(
    sound: true,
    badge: true,
    alert: true,
    announcement: false,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("message listen!");
    if (provider.role == "protectee") {
      // provider.setConnectTime();
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("message listen!");
    if (provider.role == "protectee") {
      // provider.setConnectTime();
    }
  });

  FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
}

Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message: ${message.notification?.body}');
}
