import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scanshot/models/hasil.dart';
import 'package:scanshot/models/kartu_keluarga.dart';
import 'package:scanshot/models/keluarga_kartu.dart';
import 'package:scanshot/models/firestore_history.dart';

class DataStoragePage extends StatefulWidget {
  const DataStoragePage({super.key});

  @override
  DataStoragePageState createState() => DataStoragePageState();
}

class DataStoragePageState extends State<DataStoragePage> {
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
    FirebaseFirestore.instance
        .collection('history') // Ganti dengan nama koleksi Anda
        .doc(id.toString())
        .delete()
        .then((_) => print('Berhasil menghapus data'))
        .catchError((error) => print('Gagal menghapus data: $error'));

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
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context as BuildContext, '/profile');
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 255, 255, 1),
            )),
        title: Text('Penyimpanan Data'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Hasil>>(
        future: firestoreHistory.getRiwayat(),
        builder: (BuildContext context, AsyncSnapshot<List<Hasil>> snapshot) {
          return Stack(
            children: [
              Positioned(
                top: 26,
                left: 5,
                right: 26,
                bottom: 26,
                child: _buildContent(snapshot),
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
          final kartuKeluarga = hasil.kartuKeluarga!;
          return InkWell(
            onTap: () {
              if (validId.contains(kartuKeluarga.idKK)) {
                Navigator.pushNamed(context, '/result', arguments: hasil);
              }
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 26),
              child: Row(
                children: [
                  const SizedBox(width: 22),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Hero(
                          tag: '${kartuKeluarga.idKK}',
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(73, 73, 73, 1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            alignment: Alignment.center,
                            child: _buildTextOrIcon(kartuKeluarga),
                          ),
                        ),
                        InkWell(
                            onTap: () =>
                                showConfirmationDelete(kartuKeluarga.idKK!),
                            child: Icon(
                              Icons.delete,
                              size: 36,
                              color: Colors.red,
                            )),
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
    String textKartuKeluarga = "No.KK: ${kartuKeluarga.noKK}";

    return validId.contains(kartuKeluarga.idKK)
        ? SelectableText(
            textKartuKeluarga,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
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
