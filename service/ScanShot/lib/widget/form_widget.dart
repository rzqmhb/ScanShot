import 'package:flutter/material.dart';
import 'package:scanshot/models/kartu_keluarga.dart';

class FormWidget extends StatefulWidget {
  final KartuKeluarga kartuKeluarga;

  const FormWidget({super.key, required this.kartuKeluarga});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController noKK = TextEditingController();

  final TextEditingController noK = TextEditingController();

  final TextEditingController kepalaKeluarga = TextEditingController();

  final TextEditingController alamat = TextEditingController();

  final TextEditingController rtRw = TextEditingController();

  final TextEditingController kodePos = TextEditingController();

  final TextEditingController desaKelurahan = TextEditingController();

  final TextEditingController kecamatan = TextEditingController();

  final TextEditingController kabupatenKota = TextEditingController();

  final TextEditingController provinsi = TextEditingController();

  final TextEditingController tanggalDikeluarkan = TextEditingController();

  final TextEditingController kepalaDinas = TextEditingController();

  final TextEditingController nipKepalaDinas = TextEditingController();

  @override
  void dispose() {
    noKK.dispose();

    noK.dispose();

    kepalaKeluarga.dispose();

    alamat.dispose();

    rtRw.dispose();

    kodePos.dispose();

    desaKelurahan.dispose();

    kecamatan.dispose();

    kabupatenKota.dispose();

    provinsi.dispose();

    tanggalDikeluarkan.dispose();

    kepalaDinas.dispose();

    nipKepalaDinas.dispose();
    super.dispose();
  }

  @override
  void initState() {
    noKK.text = widget.kartuKeluarga.noKK.toString();

    noK.text = widget.kartuKeluarga.noK.toString();

    kepalaKeluarga.text = widget.kartuKeluarga.kepalaKeluarga.toString();

    alamat.text = widget.kartuKeluarga.alamat.toString();

    rtRw.text = widget.kartuKeluarga.rtRw.toString();

    kodePos.text = widget.kartuKeluarga.kodePos.toString();

    desaKelurahan.text = widget.kartuKeluarga.desaKelurahan.toString();

    kecamatan.text = widget.kartuKeluarga.kecamatan.toString();

    kabupatenKota.text = widget.kartuKeluarga.kabupatenKota.toString();

    provinsi.text = widget.kartuKeluarga.provinsi.toString();

    tanggalDikeluarkan.text =
        widget.kartuKeluarga.tanggalDikeluarkan.toString();

    kepalaDinas.text = widget.kartuKeluarga.kepalaDinas.toString();

    nipKepalaDinas.text = widget.kartuKeluarga.nipKepalaDinas.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                const Padding(
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Text(
                    'Kartu Keluarga',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: noKK,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No. K',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: noK,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kepala Keluarga',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: kepalaKeluarga,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Alamat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: alamat,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'RT/RW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: rtRw,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kode Pos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: kodePos,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Desa/Kelurahan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: desaKelurahan,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kabupaten/Kota',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: kabupatenKota,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Provinsi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: provinsi,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Dikeluarkan Tanggal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: tanggalDikeluarkan,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kepala Dinas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: kepalaDinas,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NIP Kepala Dinas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nipKepalaDinas,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
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
  }
}
