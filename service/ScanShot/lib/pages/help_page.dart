// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:scanshot/basic_widgets/logo_image.dart';

class HelpPage extends StatelessWidget {
  Widget listWithIcon(
      {required BuildContext context, required String hintText}) {
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
            Navigator.pushNamed(context, '/profile');
          },
          child: ListTile(
            title: Text(
              hintText,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }

  Widget copyRight() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: Column(
        children: <Widget>[
          Text(
            '© 2023 scanShot Company',
            style: TextStyle(fontSize: 14, color: Colors.grey),
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'scanShot',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
            ),
            Text(
              'Version 1.1',
              style: TextStyle(
                  fontSize: 10, color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 30),
            LogoImage(),
            SizedBox(height: 60),
            listWithIcon(context: context, hintText: 'Pusat Bantuan'),
            listWithIcon(context: context, hintText: 'Kontak Kami'),
            listWithIcon(
                context: context, hintText: 'Syarat dan Kebijakan Privasi'),
            SizedBox(height: 10),
            copyRight()
          ],
        ),
      ),
    );
  }
}
