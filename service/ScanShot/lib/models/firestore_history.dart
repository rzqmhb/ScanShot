import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scanshot/models/anggota_keluarga.dart';
import 'package:scanshot/models/gambar.dart';
import 'package:scanshot/models/hasil.dart';
import 'package:scanshot/models/kartu_keluarga.dart';
import 'dart:math';
import 'dart:core';

int getId() {
  int randomNumber = Random().nextInt(128);
  return randomNumber;
}

class FirestoreHistory {
  CollectionReference history =
      FirebaseFirestore.instance.collection('history');

  Future<List<Hasil>> getRiwayat() async {
    User? user = FirebaseAuth.instance.currentUser;
    List<Hasil> listData = [];

    if (user != null && user.email != null) {
      var snapshot = await history.get();
      var docs = snapshot.docs;
      for (var doc in docs) {
        var data = doc.data();
        if (data != null && data is Map) {
          var riwayat = data['riwayat'];
          if (riwayat is List) {
            for (var hasil in riwayat) {
              if (hasil is Map && hasil['email'] == user.email) {
                int idHasil = hasil['hasil']['idHasil'] ?? getId();
                int idGambar = hasil['hasil']['gambar']['idGambar'] ?? getId();
                String lokasiFile = hasil['hasil']['gambar']['lokasiFile'] ??
                    'assets/sample_kk.jpg';
                DateTime waktuPengambilan =
                    hasil['hasil']['gambar']['waktuPengambilan'].toDate() ??
                        DateTime.now();

                Gambar gambar = Gambar(
                    idGambar: idGambar,
                    lokasiFile: lokasiFile,
                    waktuPengambilan: waktuPengambilan);

                var initKartuKeluarga = hasil['hasil']['kartuKeluarga'] ?? '-';

                KartuKeluarga kartuKeluarga = changeToKK(initKartuKeluarga);

                Hasil hasilAkhir = Hasil(
                    idHasil: idHasil,
                    gambar: gambar,
                    kartuKeluarga: kartuKeluarga);

                listData.add(hasilAkhir);
              }
            }
          }
        }
      }
    }
    return listData;
  }

  Future<void> deleteHasil(int idHasil) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      var snapshot = await history.get();
      var docs = snapshot.docs;
      for (var doc in docs) {
        var data = doc.data();
        if (data != null && data is Map) {
          var riwayat = data['riwayat'];
          if (riwayat is List) {
            for (var i = 0; i < riwayat.length; i++) {
              if (riwayat[i] is Map &&
                  riwayat[i]['email'] == user.email &&
                  riwayat[i]['hasil']['idHasil'] == idHasil) {
                riwayat.removeAt(i);

                await doc.reference.update({'riwayat': riwayat});
              }
            }
          }
        }
      }
    }
  }

  KartuKeluarga changeToKK(var data) {
    int idKK = data['idKK'] ?? getId();
    int noKK = data['noKK'] ?? 0;
    int noK = data['noK'] ?? 0;
    String kepalaKeluarga = data['kepalaKeluarga'] ?? "";
    String alamat = data['alamat'] ?? "";
    String rtRw = data['rtRw'] ?? '';
    int kodePos = data['kodePos'];
    String desaKelurahan = data['desaKelurahan'] ?? '-';
    String kecamatan = data['kecamatan'] ?? '-';
    String kabupatenKota = data['kabupatenKota'] ?? '-';
    String provinsi = data['provinsi'] ?? '-';
    String tanggalDikeluarkan = data['tanggalDikeluarkan'] ?? '-';
    String kepalaDinas = data['kepalaDinas'] ?? '-';
    int nipKepalaDinas = data['nipKepalaDinas'] ?? 0;
    List listAnggotaKeluarga = data['anggotaKeluarga'] ?? [];

    List<AnggotaKeluarga> anggotaKeluarga = [];

    for (var data in listAnggotaKeluarga) {
      int nik = data['nik'] ?? 0;
      String namaLengkap = data['namaLengkap'] ?? '-';
      String jenisKelamin = data['jenisKelamin'] ?? '-';
      String tempatLahir = data['tempatLahir'] ?? '-';
      String tanggalLahir = data['tanggalLahir'] ?? '-';
      String agama = data['agama'] ?? '-';
      String pendidikan = data['pendidikan'] ?? '-';
      String jenisPekerjaan = data['jenisPekerjaan'] ?? '-';
      String statusPerkawinan = data['statusPerkawinan'] ?? '-';
      String statusHubungan = data['statusHubungan'] ?? '-';
      String kewarganegaraan = data['kewarganegaraan'] ?? '-';
      int noPaspor = data['noPaspor'] ?? 0;
      int noKitap = data['noKitap'] ?? 0;
      String ayah = data['ayah'] ?? '-';
      String ibu = data['ibu'] ?? '-';

      AnggotaKeluarga anggota = AnggotaKeluarga(
          nik: nik,
          namaLengkap: namaLengkap,
          jenisKelamin: jenisKelamin,
          tempatLahir: tempatLahir,
          tanggalLahir: tanggalLahir,
          agama: agama,
          pendidikan: pendidikan,
          jenisPekerjaan: jenisPekerjaan,
          statusPerkawinan: statusPerkawinan,
          statusHubungan: statusHubungan,
          kewarganegaraan: kewarganegaraan,
          noPaspor: noPaspor,
          noKitap: noKitap,
          ayah: ayah,
          ibu: ibu);

      anggotaKeluarga.add(anggota);
    }

    KartuKeluarga kartuKeluarga = KartuKeluarga(
        idKK: idKK,
        noKK: noKK,
        noK: noK,
        kepalaKeluarga: kepalaKeluarga,
        alamat: alamat,
        rtRw: rtRw,
        kodePos: kodePos,
        desaKelurahan: desaKelurahan,
        kecamatan: kecamatan,
        kabupatenKota: kabupatenKota,
        provinsi: provinsi,
        tanggalDikeluarkan: tanggalDikeluarkan,
        kepalaDinas: kepalaDinas,
        nipKepalaDinas: nipKepalaDinas,
        anggotaKeluarga: anggotaKeluarga);

    return kartuKeluarga;
  }
}
