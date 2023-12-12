import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF494949),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  const Text('No.', style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('No. K', style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Nama Keluarga',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Alamat Keluarga',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('RT/RW', style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Kode Pos', style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Desa/Kelurahan',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Kabupaten/Kota',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Provinsi', style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Dikeluarkan Tanggal',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('Kepala Dinas',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
                  const Text('NIP Kepala Dinas',
                      style: TextStyle(color: Colors.white)),
                  TextFormField(
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
      ),
    );
  }
}
