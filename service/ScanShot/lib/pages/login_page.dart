import 'package:flutter/material.dart';
import 'package:scanshot/pages/session_manager.dart';
import 'package:scanshot/widget/image_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scanshot/widget/loading.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  void _login() async {
    String email = emailController.text;
    String password = _passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await SessionManager.setLoggedIn(true);
      await SessionManager.setUserId(FirebaseAuth.instance.currentUser!.uid);

      Navigator.of(context).pushReplacementNamed('/');
    } catch (e) {
      print('Login failed: $e');

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            content: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/error_icon.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'GAGAL',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email atau kata sandi anda kurang tepat!',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToRegister() {
    Navigator.pushNamed(context, '/register');
  }

  void _navigateToForgot() {
    Navigator.pushNamed(context, '/lupaPassword');
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingWidget(widget: LoginPage())
        : Scaffold(
            backgroundColor: const Color(0xFF252525),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text('Masuk'),
              titleTextStyle: TextStyle(color: Colors.white),
              backgroundColor: const Color(0xFF252525),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const MyImageWidget(),
                      const SizedBox(height: 20),
                      const Text(
                        'Silakan masukkan email dan kata sandi Anda',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'Email',
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFFFFC60B)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFFFFC60B)),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'password',
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFFFFC60B)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFFFFC60B)),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: _navigateToForgot,
                        child: const Row(
                          children: [
                            Text(
                              'Lupa Sandi',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                                color: Color(0xFFFFC60B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          _login();
                          setState(() {
                            isLoading = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC60B),
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(color: Color(0xFF252525)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Belum punya akun?',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: _navigateToRegister,
                        child: const Text(
                          'Daftar disini',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            color: Color(0xFFFFC60B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
