import 'package:flutter/material.dart';
import 'package:scanshot/models/hasil.dart';
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

  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    setState(() {
      data = firestoreHistory.getRiwayat();
    });
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
      body: Stack(
        children: [
          const Positioned(
            child: TitleWidget(),
          ),
          Positioned(
            top: 92,
            left: 26,
            right: 26,
            bottom: 72,
            child: ListView.builder(
              itemCount: kk.length,
              itemBuilder: (context, index) {
                final kartuKeluarga = kk[index];
                return InkWell(
                  onTap: () {
                    if (validId.contains(kartuKeluarga.id)) {
                      Navigator.pushNamed(context, '/result',
                          arguments: kartuKeluarga);
                    }
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 26),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'gambarKK-${kartuKeluarga.id}',
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
                                kartuKeluarga.gambar,
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
                                tag: 'textKK-${kartuKeluarga.id}',
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: validId.contains(kartuKeluarga.id)
                                      ? SelectableText(
                                          kartuKeluarga.teks,
                                          style: const TextStyle(
                                            color: Color(0xFF252525),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            showInvalidMessage();
                                          },
                                          child: Image.asset(
                                            'assets/error_icon.png',
                                            width: 36,
                                            height: 36,
                                          ),
                                        ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showConfirmationDelete(kartuKeluarga.id);
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
            ),
          ),
          const Positioned(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}
