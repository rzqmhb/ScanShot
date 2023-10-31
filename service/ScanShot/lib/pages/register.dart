import 'package:flutter/material.dart';
import 'package:scanshot/widget/checkBox.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  Widget icon = Image.asset(
    'assets/images/registerIcon.png',
    width: 200,
    height: 200,
  );

  Widget textField({required String hintText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: TextField(
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 198, 11), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 198, 11), width: 2.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget checkBox() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CheckBoxWidget(),
          ),
          Text(
            'Saya telah menyetujui ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
          ),
          Text(
            'syarat & ketentuan',
            style: TextStyle(
                color: Colors.blue[200],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                fontSize: 11),
          )
        ],
      ),
    );
  }

  Widget textLogin = Padding(
    padding: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Text(
          'Sudah punya akun?',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Login disini',
          style: TextStyle(color: Color.fromARGB(255, 255, 198, 11)),
        )
      ],
    ),
  );

  Widget buttonRegister() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 58),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(horizontal: 40),
            fixedSize: Size(800, 35),
            backgroundColor: Color.fromARGB(255, 255, 198, 11)),
        onPressed: () {},
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
    return MaterialApp(
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
                textField(hintText: 'Nama Pengguna'),
                textField(hintText: 'Surel'),
                textField(hintText: 'Kata Sandi'),
                textField(hintText: 'Konfirmasi Kata Sandi'),
                checkBox(),
                buttonRegister(),
                textLogin,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
