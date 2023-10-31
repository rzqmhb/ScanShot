import 'dart:js';
import 'package:flutter/material.dart';
import 'package:profile/pages/profil_page.dart';
import 'package:profile/pages/help_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ProfilePage(),
      '/help': (context) => HelpPage(),
    },
  ));
}
