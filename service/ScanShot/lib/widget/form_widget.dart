import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'No.')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'No. K')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Nama Keluarga')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Alamat Keluarga')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'RT/RW')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Kode Pos')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Desa/Kelurahan')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Kabupaten/Kota')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Provinsi')),
                  TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Dikeluarkan Tanggal')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Kepala Dinas')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'NIP Kepala Dinas')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}