// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:scanshot/basic_widgets/user_image.dart';
import 'package:scanshot/widget/logout.dart';

class ProfilePage extends StatelessWidget {
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

  Widget logout() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: Column(
        children: <Widget>[
          Text(
            'LogOut',
            style: TextStyle(fontSize: 14, color: Colors.red),
          )
        ],
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
              Navigator.of(context).pop();
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
                hintText: 'Akun',
                icon: Icons.account_circle,
                trailingIcon: Icons.arrow_right,
                route: '/#'),
            listWithIcon(context,
                hintText: 'Pengaturan',
                icon: Icons.settings,
                trailingIcon: Icons.arrow_right,
                route: '/#'),
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
          ],
        ),
      ),
      bottomNavigationBar: const Logout(),
    );
  }
}
