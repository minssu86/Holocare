import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:holocare/src/blocs/member/member_bloc.dart';
import 'package:holocare/src/repository/member_repo.dart';
import 'package:holocare/src/ui/screen/splash_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // env load
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MemberBloc(memberRepository: MemberRepository()),
        child: MaterialApp(
          title: 'HoloCare',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Center(
            child: SizedBox(
              width: 360,
              height: 800,
              child: SplashPage(),
            ),
          ),
        ));
  }
}
