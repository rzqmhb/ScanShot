import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserImage extends StatefulWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  String imagePath = '';

  @override
  void initState() {
    super.initState();
    imagePath = user?.photoURL ?? "assets/user.png";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Panggil metode untuk memperbarui foto profil
        _updateProfilePicture();
      },
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(imagePath!),
      ),
    );
  }

  void _updateProfilePicture() async {
    // Pilih gambar dari galeri atau ambil foto baru dari kamera
    final imagePicker = ImagePicker();
    final pickedSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Pilih Sumber Gambar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
                child: Text('Galeri'),
              ),
            ],
          ),
        );
      },
    );

    if (pickedSource != null) {
      final pickedImage = await imagePicker.pickImage(
        source: pickedSource,
      );

      if (pickedImage != null) {
        setState(() {
          imagePath = pickedImage.path!;
        });
        uploadFile().then((value) {
          Navigator.pushNamed(context, '/profile');
        });
      }
    }
  }

  Future<void> uploadFile() async {
    final ref = storage.ref().child('Profile-picture-user').child(user!.uid);
    File imageFile = File(imagePath);
    await ref.putFile(imageFile);
    final url = await ref.getDownloadURL();
    await user!.updatePhotoURL(url);
    await user!.reload();
    user = FirebaseAuth.instance.currentUser;

    await db.collection('users').doc(user!.uid).update({
      'photoURL': url,
    });
  }
}
