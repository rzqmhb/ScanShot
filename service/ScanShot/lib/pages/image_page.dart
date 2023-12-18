import 'dart:io';
import 'package:flutter/material.dart';

class ImageResultScreen extends StatelessWidget {
  final String imagePath;

  const ImageResultScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}