// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:scanshot/basic_widgets/user_image.dart';

class ProfilePage extends StatelessWidget {
  Widget listWithIcon(BuildContext context,
      {required String hintText,
      required IconData icon,
      required IconData trailingIcon}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(56, 56, 56, 1),
          border: Border.all(
            color: Color.fromARGB(255, 255, 198, 11),
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/help');
          },
          child: ListTile(
            leading: Icon(
              icon,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              hintText,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              trailingIcon,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
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
              Navigator.pushNamed(context, '/');
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Profil'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 8),
            UserImage(),
            SizedBox(height: 10),
            Text(
              'Edit',
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(166, 166, 166, 1)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            listWithIcon(context,
                hintText: 'Nama Pengguna',
                icon: Icons.perm_identity,
                trailingIcon: Icons.arrow_right),
            listWithIcon(context,
                hintText: 'Alamat Surel',
                icon: Icons.email_outlined,
                trailingIcon: Icons.arrow_right),
            listWithIcon(context,
                hintText: 'Kata Sandi',
                icon: Icons.lock_outlined,
                trailingIcon: Icons.arrow_right),
            listWithIcon(context,
                hintText: 'Bantuan',
                icon: Icons.help_outline,
                trailingIcon: Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
