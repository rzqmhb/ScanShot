import 'package:flutter/material.dart';
import 'package:scanshot/models/hasil.dart';
import 'package:scanshot/models/kartu_keluarga.dart';
import 'package:scanshot/models/keluarga_kartu.dart';
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

  @override
  void initState() {
    super.initState();
  }

  final List<int> validId = [1, 2];

  final List<KeluargaKartu> kk = [
    KeluargaKartu(
      id: 1,
      gambar: 'assets/sample_kk.jpg',
      teks: '''Keluarga Keluarga
      Nomor : 7308180205083847
      Kepala Keluarga : ***
      Alamat : ****
      Anggota Keluarga :
      *** :
      NIK : ***
      Kelamin :
      TTL :
      Agama :
      Pendidikan :
      Pekerjaan :
      ***
      ***''',
    ),
    KeluargaKartu(
      id: 2,
      gambar: 'assets/sample_kk.jpg',
      teks: '''Keluarga Keluarga
      Nomor : 7308180205083848
      Kepala Keluarga : ***
      Alamat : ****
      Anggota Keluarga :
      *** :
      NIK : ***
      Kelamin :
      TTL :
      Agama :
      Pendidikan :
      Pekerjaan :
      ***
      ***''',
    ),
    KeluargaKartu(
      id: 3,
      gambar: 'assets/sample_kk.jpg',
      teks: '''Keluarga Keluarga
      Nomor : 7308180205083867
      Kepala Keluarga : ***
      Alamat : ****
      Anggota Keluarga :
      *** :
      NIK : ***
      Kelamin :
      TTL :
      Agama :
      Pendidikan :
      Pekerjaan :
      ***
      ***''',
    ),
  ];

  final List<Hasil> riwayat = [];

  void removeKartuKeluarga(int id) {
    setState(() {
      kk.removeWhere((kartu) => kartu.id == id);
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
        future: firestoreHistory.getRiwayat(),
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
              if (validId.contains(kartuKeluarga.idKK)) {
                Navigator.pushNamed(context, '/result',
                    arguments: hasil);
              }
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
                        child: Image.asset(
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
                          tag: 'textKK',
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
                        InkWell(
                          onTap: () =>
                              showConfirmationDelete(kartuKeluarga.idKK!),
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
    return validId.contains(kartuKeluarga.idKK)
        ? SelectableText(
            kartuKeluarga.noKK.toString(),
            style: const TextStyle(
              color: Color(0xFF252525),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        : InkWell(
            onTap: () => showInvalidMessage(),
            child: Image.asset(
              'assets/error_icon.png',
              width: 36,
              height: 36,
            ),
          );
  }
}
