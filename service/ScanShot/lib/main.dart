import 'dart:js';
import 'package:flutter/material.dart';
import 'package:scanshot/register.dart';
import 'package:profile/pages/profil_page.dart';
import 'package:profile/pages/help_page.dart';
import 'package:scanshot/pages/scan.dart';
import 'package:scanshot/pages/scanPreview.dart';
import 'package:scanshot/pages/dashboard.dart';
import 'package:scanshot/pages/result.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const DashboardPage(),
      '/profile': (context) => ProfilePage(),
      '/help': (context) => HelpPage(),
      '/result': (context) => const ResultPage(),
      '/scanPreview' : (context) => const ScanPreview(),
      '/scan' : (context) => const Scan(),
      '/register': (context) => RegisterPage(),
    },
  ));
}
