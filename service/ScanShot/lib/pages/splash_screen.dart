import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    // Navigator.pushNamed(context, '/login');
    if (!mounted) {
      // return;
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Image.asset(
          'assets/logo1.png',
          width: 200,
          height: 200,
        ),
      )),
    );
  }
}
