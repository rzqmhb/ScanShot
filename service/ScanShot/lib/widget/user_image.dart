// import 'package:flutter/material.dart';

// class UserImage extends StatelessWidget {
//   const UserImage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Image(
//       image: AssetImage("assets/user.png"),
//       width: 60,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImage extends StatefulWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  // Simpan path atau data foto profil pengguna di sini
  String imagePath = "assets/user.png";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Panggil metode untuk memperbarui foto profil
        _updateProfilePicture();
      },
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(imagePath),
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
      }
    }
  }
}

