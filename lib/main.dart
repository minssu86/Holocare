import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:holocare/config/routes.dart';
import 'package:holocare/pages/init_screen.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var fcmToken = await FirebaseMessaging.instance
      .getToken(vapidKey: "Qhln6dEshV32n-q5O_tLSsbloq65vB5SeXnGlASrvW8");
  print(fcmToken);

  UserProvider userprovider = UserProvider();
  await userprovider.init();
  _configureFirebaseMessaging(userprovider);
  FlutterNativeSplash.remove();
  runApp(
    MyApp(userProvider: userprovider),
  );
}

class MyApp extends StatelessWidget {
  final UserProvider userProvider;
  const MyApp({super.key, required this.userProvider});
  @override
  Widget build(BuildContext context) {
    print("main");
    return ChangeNotifierProvider(
        create: (context) => userProvider,
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: InitScreen(),
        ));
  }
}

void _configureFirebaseMessaging(UserProvider provider) {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  firebaseMessaging.requestPermission(
    sound: true,
    badge: true,
    alert: true,
    announcement: false,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (provider.role == "protectee") {
      print("update");
      provider.updateConnectTime();
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (provider.role == "protectee") {
      print("update");
      provider.updateConnectTime();
    }
  });

  // FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
}

// Future<void> _handleBackgroundMessage(RemoteMessage message) async {
//   print('Handling a background message: ${message.notification?.body}');
//   // 앱이 백그라운드에서 실행 중일 때 수신한 메시지를 처리하는 로직을 작성하세요.
// }
