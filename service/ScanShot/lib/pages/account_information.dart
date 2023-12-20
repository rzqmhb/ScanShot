import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InformasiAkun extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  Widget listAkun(BuildContext context,
      {required String hintText, required String rightText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(73, 73, 73, 1),
          border: Border.all(
            color: Color.fromRGBO(110, 110, 110, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: ListTile(
          title: Text(
            hintText,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          trailing: Text(
            rightText,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context as BuildContext, '/profile');
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 255, 255, 1),
            )),
        title: Text('Informasi Akun'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 30),
            listAkun(context, hintText: 'Email', rightText: user.email!),
            SizedBox(height: 10),
            listAkun(context, hintText: 'Nama Pengguna', rightText: 'User'),
            SizedBox(height: 10),
            listAkun(context, hintText: 'Kata Sandi', rightText: '*******'),
          ],
        ),
      ),
    );
  }
}
