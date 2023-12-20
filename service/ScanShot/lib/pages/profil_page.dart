// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanshot/widget/user_image.dart';

class ProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  void _logout() {
    FirebaseAuth.instance.signOut();
  }

  Widget listWithIcon(BuildContext context,
      {required String hintText,
      required IconData icon,
      required IconData trailingIcon,
      required String route}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(73, 73, 73, 1),
          border: Border.all(
            color: Color.fromRGBO(110, 110, 110, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
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
              Navigator.pushNamed(context as BuildContext, '/');
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 255, 255, 1),
            )),
        title: Text('Profil'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 8),
            UserImage(),
            SizedBox(height: 10),
            Text(
              'Hello ${user.displayName}',
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(166, 166, 166, 1)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            listWithIcon(context,
                hintText: 'Akun',
                icon: Icons.account_circle,
                trailingIcon: Icons.arrow_right,
                route: '/informasiAkun'),
            listWithIcon(context,
                hintText: 'Penyimpanan Data',
                icon: Icons.storage,
                trailingIcon: Icons.arrow_right,
                route: '/#'),
            SizedBox(height: 40),
            listWithIcon(context,
                hintText: 'Bantuan',
                icon: Icons.help_outline,
                trailingIcon: Icons.arrow_right,
                route: '/help'),
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi'),
                      content: Text('Apakah Anda yakin ingin logout?'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      contentTextStyle: TextStyle(color: Colors.white),
                      backgroundColor: const Color(0xFF252525),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Batal',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _logout,
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 35, 11),
                fixedSize: Size(100, 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
