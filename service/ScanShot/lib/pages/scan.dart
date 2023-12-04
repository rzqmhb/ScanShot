import 'package:flutter/material.dart';
import 'package:scanshot/widget/camera.dart';

class Scan extends StatelessWidget {
  Scan({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, '/scanPreview');
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: <Widget> [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Camera(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Image(
                    image: AssetImage('assets/scan_shutter.png'),
                    width: 75,
                    height: 75,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}