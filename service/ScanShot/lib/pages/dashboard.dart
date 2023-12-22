import 'package:flutter/material.dart';
import 'package:scanshot/models/hasil.dart';
import 'package:scanshot/models/kartu_keluarga.dart';
import 'package:scanshot/models/firestore_history.dart';
import 'package:scanshot/widget/footer.dart';
import 'package:scanshot/widget/title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  FirestoreHistory firestoreHistory = FirestoreHistory();

  late Future<List<Hasil>> initHasil;

  @override
  void initState() {
    super.initState();
    initHasil = firestoreHistory.getRiwayat();
  }

  void removeKartuKeluarga(int id) {
    setState(() {
      initHasil = firestoreHistory.deleteHasil(id);
    });
  }

  void showInvalidMessage() {
    AlertDialog dialog = AlertDialog(
      title: const Text('Kartu Keluarga Tidak Dikenali'),
      content: const Text(
          'Nomor Kartu Keluarga tidak dikenali, harap memindai Kartu Keluarga yang asli untuk memperoleh teks.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Tutup'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  void showConfirmationDelete(int id) {
    AlertDialog dialog = AlertDialog(
      title: const Text("Konfirmasi Hapus"),
      content: const Text('Hapus Riwayat ?'),
      actions: [
        TextButton(
          child: const Text("Ya"),
          onPressed: () {
            removeKartuKeluarga(id);
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Tidak"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(context: context, builder: (context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Hasil>>(
        future: initHasil,
        builder: (BuildContext context, AsyncSnapshot<List<Hasil>> snapshot) {
          return Stack(
            children: [
              const Positioned(
                child: TitleWidget(),
              ),
              Positioned(
                top: 92,
                left: 26,
                right: 26,
                bottom: 72,
                child: _buildContent(snapshot),
              ),
              const Positioned(
                child: FooterWidget(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(AsyncSnapshot<List<Hasil>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final hasil = snapshot.data![index];
          final gambar = hasil.gambar!;
          final kartuKeluarga = hasil.kartuKeluarga!;
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/result', arguments: hasil);
              // if (validId.contains(kartuKeluarga.idKK)) {
              //   Navigator.pushNamed(context, '/result', arguments: hasil);
              // }
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(bottom: 26),
              child: Row(
                children: [
                  Hero(
                    tag: '${gambar.idGambar}',
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          gambar.lokasiFile.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Hero(
                          tag: '${kartuKeluarga.idKK}',
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            alignment: Alignment.center,
                            child: _buildTextOrIcon(kartuKeluarga),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Konfirmasi Hapus Riwayat'),
                                  content: const Text(
                                      'Apakah Anda yakin ingin menghapus riwayat ini?'),
                                  titleTextStyle:
                                      const TextStyle(color: Colors.white),
                                  contentTextStyle:
                                      const TextStyle(color: Colors.white),
                                  backgroundColor: const Color(0xFF252525),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Batal',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Hapus',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        removeKartuKeluarga(hasil.idHasil!);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/delete_icon.png',
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else if (snapshot.hasError) {
      return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildTextOrIcon(KartuKeluarga kartuKeluarga) {
    String textKartuKeluarga =
        "Kartu Keluarga\n\nNo.K: ${kartuKeluarga.noK}\nNo.KK: ${kartuKeluarga.noKK}\nKepala Keluarga: ${kartuKeluarga.kepalaKeluarga}\nAlamat: ${kartuKeluarga.alamat}\nRT/RW: ${kartuKeluarga.rtRw}\nKode Pos: ${kartuKeluarga.kodePos}\nDesa/Kelurahan: ${kartuKeluarga.desaKelurahan}\nKecamatan: ${kartuKeluarga.kecamatan}\nKabupaten/Kota: ${kartuKeluarga.kabupatenKota}\nProvinsi: ${kartuKeluarga.provinsi}\nTanggal Dikeluarkan: ${kartuKeluarga.tanggalDikeluarkan}\nKepala Dinas: ${kartuKeluarga.kepalaDinas}\nNIP Kepala Dinas: ${kartuKeluarga.nipKepalaDinas}\n\nAnggota Keluarga\n\n";
    for (var anggotaKeluarga in kartuKeluarga.anggotaKeluarga) {
      String anggotaText =
          "NIK: ${anggotaKeluarga.nik}\n\nNama Lengkap: ${anggotaKeluarga.namaLengkap}\nJenis Kelamin: ${anggotaKeluarga.jenisKelamin}\nTempat Lahir: ${anggotaKeluarga.tempatLahir}\n Tanggal Lahir: ${anggotaKeluarga.tanggalLahir}\nAgama: ${anggotaKeluarga.agama}\nPendidikan: ${anggotaKeluarga.pendidikan}\nJenis Pekerjaan: ${anggotaKeluarga.jenisPekerjaan}\nStatus Perkawinan: ${anggotaKeluarga.statusPerkawinan}\nStatus Hubungan: ${anggotaKeluarga.statusHubungan}\nKewarganegaraan: ${anggotaKeluarga.kewarganegaraan}\nNo.Paspor: ${anggotaKeluarga.noPaspor}\nNo.Kitap: ${anggotaKeluarga.noKitap}\nAyah: ${anggotaKeluarga.ayah}\nIbu: ${anggotaKeluarga.ibu}\n\n";
      textKartuKeluarga += anggotaText;
    }
    return SelectableText(
      textKartuKeluarga,
      style: const TextStyle(
        color: Color(0xFF252525),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
