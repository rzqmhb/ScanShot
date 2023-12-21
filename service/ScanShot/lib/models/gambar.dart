import 'dart:core';
import 'dart:math';

int getId() {
  int randomNumber = Random().nextInt(128);
  return randomNumber;
}

class Gambar {
  int idGambar = getId();
  String lokasiFile = 'assets/sample_kk.jpg';
  DateTime waktuPengambilan = DateTime.now();

  Gambar({
    required this.idGambar,
    required this.lokasiFile,
    required this.waktuPengambilan,
  });
}
