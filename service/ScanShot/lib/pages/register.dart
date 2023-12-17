import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scanshot/widget/checkBox.dart';
import 'package:scanshot/widget/dialog_error.dart';
import 'package:scanshot/widget/loading.dart';
import 'package:scanshot/widget/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _register() async {
    // Proses register
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Navigator.pushNamed(context, '/');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogError(
              error: 'Format Email Tidak Benar, Coba Lagi!',
            );
          },
        );
      } else if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogError(
              error: 'Password Terlalu Mudah, Coba Lagi!',
            );
          },
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogError(
              error: 'Email Sudah Digunakan!',
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget icon = Image.asset(
    'assets/images/registerIcon.png',
    width: 200,
    height: 200,
  );

  Widget textLogin(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            'Sudah punya akun?',
            style: TextStyle(color: Colors.white),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Login disini',
              style: TextStyle(color: Color.fromARGB(255, 255, 198, 11)),
            ),
          )
        ],
      ),
    );
  }

  bool isLoading = false;
  bool isChecked = false;

  Widget buttonRegister(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 58),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(horizontal: 40),
            fixedSize: Size(800, 35),
            backgroundColor: Color.fromARGB(255, 255, 198, 11)),
        onPressed: isChecked
            ? () async {
                setState(() {
                  isLoading = true;
                });

                await Future.delayed(Duration(seconds: 2));
                _register();
                setState(() {
                  isLoading = false;
                });
              }
            : null,
        child: Text(
          'REGISTRASI',
          style: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingWidget(widget: RegisterPage())
        : MaterialApp(
            title: 'Flutter layout demo',
            home: Scaffold(
              backgroundColor: Color.fromARGB(255, 37, 37, 37),
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 37, 37, 37),
                title: const Text(
                  'Daftar Akun',
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      icon,
                      TextFieldWidget(
                        hintText: 'Surel',
                        controller: emailController,
                      ),
                      TextFieldWidget(
                        hintText: 'Kata Sandi',
                        controller: passwordController,
                      ),
                      CheckBoxWidget(
                        onCheckboxChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      buttonRegister(context),
                      textLogin(context),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
