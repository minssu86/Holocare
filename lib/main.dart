import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holocare/config/notification.dart';
import 'package:holocare/config/routes.dart';
import 'package:holocare/data/repositories/user_repository.dart';
import 'package:holocare/firebase_options.dart';
import 'package:holocare/pages/splash_page.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Holocare());
}

class Holocare extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Holocare({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterLocalNotification.init();
    FlutterLocalNotification.requestNotificationPermission();
    UserProvider provider = UserProvider(
      auth: auth,
      db: db,
      repository: UserRepository(auth, db),
    );
    // configureFirebaseMessaging(provider);
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: const MaterialApp(
        title: 'Holocare',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: SplashPage(),
      ),
    );
  }
}
