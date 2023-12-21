import 'package:scanshot/models/anggota_keluarga.dart';

class KartuKeluarga {
  int idKK = 0;
  int noKK = 0;
  int noK = 0;
  String kepalaKeluarga = '';
  String alamat = '';
  int rt = 0;
  int rw = 0;
  int kodePos = 0;
  String desaKelurahan = '';
  String kecamatan = '';
  String kabupatenKota = '';
  String provinsi = '';
  String tanggalDikeluarkan = '';
  String kepalaDinas = '';
  int nipKepalaDinas = 0;
  List<AnggotaKeluarga> anggotaKeluarga = List.empty();

  KartuKeluarga({
    required this.idKK,
    required this.noKK,
    required this.noK,
    required this.kepalaKeluarga,
    required this.alamat,
    required this.rt,
    required this.rw,
    required this.kodePos,
    required this.desaKelurahan,
    required this.kecamatan,
    required this.kabupatenKota,
    required this.provinsi,
    required this.tanggalDikeluarkan,
    required this.kepalaDinas,
    required this.nipKepalaDinas,
    required this.anggotaKeluarga,
  });
}
