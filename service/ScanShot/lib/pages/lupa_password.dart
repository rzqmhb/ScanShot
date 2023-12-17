import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LupaPassword extends StatefulWidget {
  LupaPassword({Key? key}) : super(key: key);

  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  final  emailController = TextEditingController();

  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void lupaPassword() async {
    try {
    await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text('Pembaharuan kata sandi telah dikirimkan, silahkan periksa email anda!'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  void _navigateToHome() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Lupa Kata Sandi?',
          style: TextStyle(
            color: Color(0xFFFFC60B),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF252525),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Masukkan Email anda untuk melakukan reset kata sandi',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'Email',
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFFFFC60B)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFFFFC60B)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    lupaPassword();
                  },
                  child: Text(
                    'Kirim',
                    style: TextStyle(color: Color(0xFF252525)),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFC60B),
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
