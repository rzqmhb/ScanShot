import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Profile Button
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 72,
            decoration: const BoxDecoration(
              color: Color(0xFFFFC60B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: Image.asset(
                        'assets/go_to_profile_button.png',
                        width: 192,
                        height: 51,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Scan Button
        Positioned(
          left: 26,
          bottom: 19,
          child: Image.asset('assets/scan_button.png', width: 100, height: 100),
        ),
      ],
    );
  }
}
