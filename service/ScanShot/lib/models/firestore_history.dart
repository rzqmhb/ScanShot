import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scanshot/models/anggota_keluarga.dart';
import 'package:scanshot/models/gambar.dart';
import 'package:scanshot/models/hasil.dart';
import 'package:scanshot/models/kartu_keluarga.dart';

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
                int idHasil = hasil['hasil']['idHasil'];
                int idGambar = hasil['hasil']['gambar']['idGambar'];
                String lokasiFile = hasil['hasil']['gambar']['lokasiFile'];
                DateTime waktuPengambilan =
                    hasil['hasil']['gambar']['waktuPengambilan'].toDate();

                Gambar gambar = Gambar(
                    idGambar: idGambar,
                    lokasiFile: lokasiFile,
                    waktuPengambilan: waktuPengambilan);

                int idKK = hasil['hasil']['kartuKeluarga']['idKK'];
                int noKK = hasil['hasil']['kartuKeluarga']['noKK'];
                int noK = hasil['hasil']['kartuKeluarga']['noK'];
                String kepalaKeluarga =
                    hasil['hasil']['kartuKeluarga']['kepalaKeluarga'];
                String alamat = hasil['hasil']['kartuKeluarga']['alamat'];
                int rt = hasil['hasil']['kartuKeluarga']['rt'];
                int rw = hasil['hasil']['kartuKeluarga']['rw'];
                int kodePos = hasil['hasil']['kartuKeluarga']['kodePos'];
                String desaKelurahan =
                    hasil['hasil']['kartuKeluarga']['desaKelurahan'];
                String kecamatan = hasil['hasil']['kartuKeluarga']['kecamatan'];
                String kabupatenKota =
                    hasil['hasil']['kartuKeluarga']['kabupatenKota'];
                String provinsi = hasil['hasil']['kartuKeluarga']['provinsi'];
                String tanggalDikeluarkan =
                    hasil['hasil']['kartuKeluarga']['tanggalDikeluarkan'];
                String kepalaDinas =
                    hasil['hasil']['kartuKeluarga']['kepalaDinas'];
                int nipKepalaDinas =
                    hasil['hasil']['kartuKeluarga']['nipKepalaDinas'];
                List listAnggotaKeluarga =
                    hasil['hasil']['kartuKeluarga']['anggotaKeluarga'];

                List<AnggotaKeluarga> anggotaKeluarga = [];

                for (var data in listAnggotaKeluarga) {
                  int nik = data['nik'];
                  String namaLengkap = data['namaLengkap'];
                  String jenisKelamin = data['jenisKelamin'];
                  String tempatLahir = data['tempatLahir'];
                  String tanggalLahir = data['tanggalLahir'];
                  String agama = data['agama'];
                  String pendidikan = data['pendidikan'];
                  String jenisPekerjaan = data['jenisPekerjaan'];
                  String statusPerkawinan = data['statusPerkawinan'];
                  String statusHubungan = data['statusHubungan'];
                  String kewarganegaraan = data['kewarganegaraan'];
                  int noPaspor = data['noPaspor'];
                  int noKitap = data['noKitap'];
                  String ayah = data['ayah'];
                  String ibu = data['ibu'];

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
                    rt: rt,
                    rw: rw,
                    kodePos: kodePos,
                    desaKelurahan: desaKelurahan,
                    kecamatan: kecamatan,
                    kabupatenKota: kabupatenKota,
                    provinsi: provinsi,
                    tanggalDikeluarkan: tanggalDikeluarkan,
                    kepalaDinas: kepalaDinas,
                    nipKepalaDinas: nipKepalaDinas,
                    anggotaKeluarga: anggotaKeluarga);

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

  // Future<void> updateFormWidget() {

  // }
}
