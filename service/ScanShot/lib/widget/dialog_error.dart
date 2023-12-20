import 'package:flutter/material.dart';

class DialogError extends StatelessWidget {
  // const DialogError({super.key});
  final String error;

  DialogError({required this.error});

  @override
  Widget build(BuildContext context) {
    // return Dialog(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(error),
    //         const SizedBox(height: 15),
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('Close'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return AlertDialog(
      content: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/error_icon.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              const Text(
                'GAGAL',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                error,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
