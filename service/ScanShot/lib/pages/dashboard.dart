import 'package:flutter/material.dart';
import 'package:scanshot/models/keluarga_kartu.dart';
import 'package:scanshot/widget/footer.dart';
import 'package:scanshot/widget/title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
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

  void removeKartuKeluarga(int id) {
    setState(() {
      kk.removeWhere((kartu) => kartu.id == id);
    });
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
                    Navigator.pushNamed(context, '/result',
                        arguments: kartuKeluarga);
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
                                  child: SelectableText(
                                    kartuKeluarga.teks,
                                    style: const TextStyle(
                                      color: Color(0xFF252525),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  removeKartuKeluarga(kartuKeluarga.id);
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
