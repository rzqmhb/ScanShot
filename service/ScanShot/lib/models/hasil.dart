import 'package:scanshot/models/gambar.dart';
import 'package:scanshot/models/kartu_keluarga.dart';

class Hasil {
  int? idHasil;
  Gambar? gambar;
  KartuKeluarga? kartuKeluarga;

  Hasil({
    this.idHasil,
    this.gambar,
    this.kartuKeluarga,
  });
}
