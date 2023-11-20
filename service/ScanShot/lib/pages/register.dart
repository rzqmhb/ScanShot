import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scanshot/widget/checkBox.dart';
import 'package:scanshot/widget/loading.dart';
import 'package:scanshot/widget/textField.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            isLoading = false;
          });
          Navigator.pushNamed(context, '/');
        },
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
                      TextFieldWidget(hintText: 'Nama Pengguna'),
                      TextFieldWidget(hintText: 'Surel'),
                      TextFieldWidget(hintText: 'Kata Sandi'),
                      TextFieldWidget(hintText: 'Konfirmasi Kata Sandi'),
                      CheckBoxWidget(),
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
