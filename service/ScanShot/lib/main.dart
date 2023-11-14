import 'dart:js';
import 'package:flutter/material.dart';
import 'package:scanshot/pages/register.dart';
import 'package:scanshot/pages/profil_page.dart';
import 'package:scanshot/pages/help_page.dart';
import 'package:scanshot/pages/scan.dart';
import 'package:scanshot/pages/scanPreview.dart';
import 'package:scanshot/pages/dashboard.dart';
import 'package:scanshot/pages/result.dart';
import 'package:scanshot/pages/login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF252525),
    ),
    initialRoute: '/help',
    routes: {
      '/': (context) => const DashboardPage(),
      '/profile': (context) => ProfilePage(),
      '/help': (context) => HelpPage(),
      '/result': (context) => const ResultPage(),
      '/scanPreview': (context) => ScanPreview(),
      '/scan': (context) => Scan(),
      '/register': (context) => RegisterPage(),
      '/login': (context) => LoginPage(), // Halaman login
    },
  ));
}
