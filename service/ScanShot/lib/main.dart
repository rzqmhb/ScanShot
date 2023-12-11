// import 'dart:js';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scanshot/pages/register.dart';
import 'package:scanshot/pages/profil_page.dart';
import 'package:scanshot/pages/help_page.dart';
import 'package:scanshot/pages/scan.dart';
import 'package:scanshot/pages/scanPreview.dart';
import 'package:scanshot/pages/dashboard.dart';
import 'package:scanshot/pages/result.dart';
import 'package:scanshot/pages/login_page.dart';
import 'package:scanshot/pages/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF252525),
    ),
    initialRoute: '/splash',
    routes: {
      '/result': (context) => const ResultPage(),
      '/splash': (context) => const Splash(),
    },
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/login':
          return PageTransition(child: LoginPage(), type: PageTransitionType.fade, settings: settings,);
        case '/register':
          return PageTransition(child: RegisterPage(), type: PageTransitionType.topToBottom, settings: settings,);
        case '/':
          return PageTransition(child: const DashboardPage(), type: PageTransitionType.rightToLeft, settings: settings,);
        case '/profile':
          return PageTransition(child: ProfilePage(), type: PageTransitionType.rightToLeft, settings: settings,);
        case '/help':
          return PageTransition(child: HelpPage(), type: PageTransitionType.bottomToTop, settings: settings,);
        case '/scanPreview':
          return PageTransition(child: ScanPreview(), type: PageTransitionType.leftToRight, settings: settings,);
        case '/scan':
          return PageTransition(child: Scan(), type: PageTransitionType.bottomToTop, settings: settings,);
        default:
          return null;
      }
    },
  ));
}
