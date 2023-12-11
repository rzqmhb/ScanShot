import 'package:flutter/material.dart';

class TitleFormWidget extends StatelessWidget {
  const TitleFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Container(
              width: 271,
              height: 59,
              decoration: const BoxDecoration(
                color: Color(0xFF252525),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Detail Form',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xFFFFC60B),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
