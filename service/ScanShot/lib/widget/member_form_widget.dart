import 'package:flutter/material.dart';
import 'package:scanshot/models/anggota_keluarga.dart';

class MemberFormWidget extends StatefulWidget {
  final List<AnggotaKeluarga> anggotaKeluarga;
  final ScrollController scrollController;

  const MemberFormWidget({super.key, required this.anggotaKeluarga, required this.scrollController});

  @override
  State<MemberFormWidget> createState() => _MemberFormWidgetState();
}

class _MemberFormWidgetState extends State<MemberFormWidget> {
  late ScrollController scrollController;
  late List<AnggotaKeluarga> anggota;
  late int len;

  late List<TextEditingController> noKK;
  late List<TextEditingController> nik;
  late List<TextEditingController> namaLengkap;
  late List<TextEditingController> jenisKelamin;
  late List<TextEditingController> tempatLahir;
  late List<TextEditingController> tanggalLahir;
  late List<TextEditingController> agama;
  late List<TextEditingController> pendidikan;
  late List<TextEditingController> jenisPekerjaan;
  late List<TextEditingController> statusPerkawinan;
  late List<TextEditingController> statusHubungan;
  late List<TextEditingController> kewarganegaraan;
  late List<TextEditingController> noPaspor;
  late List<TextEditingController> noKitap;
  late List<TextEditingController> ayah;
  late List<TextEditingController> ibu;

  @override
  void dispose() {
    for (int i = 0; i < len; i++) {
      nik[i].dispose();
      namaLengkap[i].dispose();
      jenisKelamin[i].dispose();
      tempatLahir[i].dispose();
      tanggalLahir[i].dispose();
      agama[i].dispose();
      pendidikan[i].dispose();
      jenisPekerjaan[i].dispose();
      statusPerkawinan[i].dispose();
      statusHubungan[i].dispose();
      kewarganegaraan[i].dispose();
      noPaspor[i].dispose();
      noKitap[i].dispose();
      ayah[i].dispose();
      ibu[i].dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController;
    anggota = widget.anggotaKeluarga;
    len = anggota.length;

    nik = List.generate(len, (index) => TextEditingController());
    namaLengkap = List.generate(len, (index) => TextEditingController());
    jenisKelamin = List.generate(len, (index) => TextEditingController());
    tempatLahir = List.generate(len, (index) => TextEditingController());
    tanggalLahir = List.generate(len, (index) => TextEditingController());
    agama = List.generate(len, (index) => TextEditingController());
    pendidikan = List.generate(len, (index) => TextEditingController());
    jenisPekerjaan = List.generate(len, (index) => TextEditingController());
    statusPerkawinan = List.generate(len, (index) => TextEditingController());
    statusHubungan = List.generate(len, (index) => TextEditingController());
    kewarganegaraan = List.generate(len, (index) => TextEditingController());
    noPaspor = List.generate(len, (index) => TextEditingController());
    noKitap = List.generate(len, (index) => TextEditingController());
    ayah = List.generate(len, (index) => TextEditingController());
    ibu = List.generate(len, (index) => TextEditingController());

    for (int i = 0; i < len; i++) {
      nik[i].text = anggota[i].nik.toString();
      namaLengkap[i].text = anggota[i].namaLengkap.toString();
      jenisKelamin[i].text = anggota[i].jenisKelamin.toString();
      tempatLahir[i].text = anggota[i].tempatLahir.toString();
      tanggalLahir[i].text = anggota[i].tanggalLahir.toString();
      agama[i].text = anggota[i].agama.toString();
      pendidikan[i].text = anggota[i].agama.toString();
      jenisPekerjaan[i].text = anggota[i].jenisPekerjaan.toString();
      statusPerkawinan[i].text = anggota[i].statusPerkawinan.toString();
      statusHubungan[i].text = anggota[i].statusHubungan.toString();
      kewarganegaraan[i].text = anggota[i].kewarganegaraan.toString();
      noPaspor[i].text = anggota[i].noPaspor.toString();
      noKitap[i].text = anggota[i].noKitap.toString();
      ayah[i].text = anggota[i].ayah.toString();
      ibu[i].text = anggota[i].ibu.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
        itemCount: anggota.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF494949),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: namaLengkap[index],
                        decoration: const InputDecoration(
                          fillColor: Color(0xFFFFC60B),
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'NIK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: nik[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Jenis Kelamin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: jenisKelamin[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tempat Lahir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: tempatLahir[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tanggal Lahir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: tanggalLahir[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Agama',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: agama[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pendidikan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: pendidikan[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Jenis Pekerjaan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: jenisPekerjaan[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Status Perkawinan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: statusPerkawinan[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Status Hubungan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: statusHubungan[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Kewarganegaraan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: kewarganegaraan[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'No. Paspor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: noPaspor[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'No. KITAP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: noKitap[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ayah',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: ayah[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ibu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: ibu[index],
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
