import 'package:flutter/material.dart';

class MemberFormWidget extends StatelessWidget {
  const MemberFormWidget({super.key});

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
                      decoration:
                          const InputDecoration(labelText: 'Nama Lengkap')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'NIK')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Jenis Kelamin')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Tempat Lahir')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Tanggal Lahir')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Agama')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Pendidikan')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Jenis Pekerjaan')),
                  TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Status Perkawinan')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Status Hubungan')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Kewarganegaraan')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'No. Paspor')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'No. KITAP')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Ayah')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Ibu')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
