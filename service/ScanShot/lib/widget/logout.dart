import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Container(
        height: 45.0,
        color: Color.fromRGBO(37, 37, 37, 1),
        child: const Center(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
