import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GantiPassword extends StatefulWidget {
  GantiPassword({super.key});

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  final user = FirebaseAuth.instance.currentUser!;
  final emailController = TextEditingController();

  void editPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
                'Pembaharuan kata sandi telah dikirimkan, silahkan periksa email anda!'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/informasiAkun');
          },
          child: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        title: Text('Ubah Email'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
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
                    editPassword();
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
