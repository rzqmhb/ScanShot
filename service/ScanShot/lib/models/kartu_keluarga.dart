import 'package:scanshot/models/anggota_keluarga.dart';

class KartuKeluarga {
  int? idKK;
  int? noKK;
  int? noK;
  String? kepalaKeluarga;
  String? alamat;
  int? rt;
  int? rw;
  int? kodePos;
  String? desaKelurahan;
  String? kecamatan;
  String? kabupatenKota;
  String? provinsi;
  String? tanggalDikeluarkan;
  String? kepalaDinas;
  int? nipKepalaDinas;
  List<AnggotaKeluarga> anggotaKeluarga;

  KartuKeluarga({
    this.idKK,
    this.noKK,
    this.noK,
    this.kepalaKeluarga,
    this.alamat,
    this.rt,
    this.rw,
    this.kodePos,
    this.desaKelurahan,
    this.kecamatan,
    this.kabupatenKota,
    this.provinsi,
    this.tanggalDikeluarkan,
    this.kepalaDinas,
    this.nipKepalaDinas,
    this.anggotaKeluarga = const [],
  });
}
