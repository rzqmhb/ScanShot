// import 'dart:js';

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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF252525),
    ),
    initialRoute: '/splash',
    routes: {
      // '/': (context) => const DashboardPage(),
      // '/profile': (context) => ProfilePage(),
      // '/help': (context) => HelpPage(),
      '/result': (context) => const ResultPage(),
      // '/scanPreview': (context) => ScanPreview(),
      // '/scan': (context) => Scan(),
      // '/register': (context) => RegisterPage(),
      // '/login': (context) => LoginPage(), // Halaman login
      '/splash': (context) => const Splash(),
    },
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/login':
          return PageTransition(child: LoginPage(), type: PageTransitionType.fade, settings: settings,);
          break;
        case '/register':
          return PageTransition(child: RegisterPage(), type: PageTransitionType.topToBottom, settings: settings,);
          break;
        case '/':
          return PageTransition(child: const DashboardPage(), type: PageTransitionType.rightToLeft, settings: settings,);
          break;
        case '/profile':
          return PageTransition(child: ProfilePage(), type: PageTransitionType.rightToLeft, settings: settings,);
          break;
        case '/help':
          return PageTransition(child: HelpPage(), type: PageTransitionType.bottomToTop, settings: settings,);
          break;
        case '/scanPreview':
          return PageTransition(child: ScanPreview(), type: PageTransitionType.leftToRight, settings: settings,);
          break;
        case '/scan':
          return PageTransition(child: Scan(), type: PageTransitionType.bottomToTop, settings: settings,);
          break;
        default:
          return null;
      }
    },
  ));
}
