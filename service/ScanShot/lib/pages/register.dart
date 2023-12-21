import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scanshot/widget/checkBox.dart';
import 'package:scanshot/widget/dialog_error.dart';
import 'package:scanshot/widget/loading.dart';
import 'package:scanshot/widget/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? image;

  void _register() async {
    // Proses register
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      User? user = userCredential.user;

      if (user != null) {
        final ref = storage.ref().child('Profile-picture-user').child(user.uid);
        File imageFile = File(image!.path);
        await ref.putFile(imageFile);
        final url = await ref.getDownloadURL();

        await user.updateDisplayName(usernameController.text);
        await user.updatePhotoURL(url);
        await user.reload();
        user = auth.currentUser;

        await db.collection('users').doc(user!.uid).set({
          'username': usernameController.text,
          'photoURL': url,
        });

        Navigator.pushNamed(context, '/');
      }
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

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  void uploadDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade800,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            title: const Text(
              'Unggah Dari',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 9,
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Text(
                          'Galeri',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Text(
                          'Kamera',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget uploadField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: const Color.fromARGB(255, 255, 198, 11), width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              image == null ? 'Tidak ada berkas' : image!.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 198, 11)),
              onPressed: () {
                uploadDialog();
              },
              child: const Text(
                'Pilih Berkas',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget icon = Image.asset(
    'assets/images/registerIcon.png',
    width: 200,
    height: 200,
  );

  Widget textLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const Text(
            'Sudah punya akun?',
            style: TextStyle(color: Colors.white),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Text(
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
      padding: const EdgeInsets.symmetric(horizontal: 58),
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
            title: 'ScanShot : Daftar Akun',
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: const Color.fromARGB(255, 37, 37, 37),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                elevation: 0,
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
                        hintText: 'Nama Pengguna',
                        controller: usernameController,
                      ),
                      TextFieldWidget(
                        hintText: 'Kata Sandi',
                        controller: passwordController,
                      ),
                      uploadField(),
                      CheckBoxWidget(
                        onCheckboxChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        isChecked: isChecked,
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
