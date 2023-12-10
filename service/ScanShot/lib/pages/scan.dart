import 'package:flutter/material.dart';
import 'package:scanshot/widget/camera.dart';

class Scan extends StatelessWidget {
  Scan({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, '/scanPreview');
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: <Widget> [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Camera(),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 45),
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