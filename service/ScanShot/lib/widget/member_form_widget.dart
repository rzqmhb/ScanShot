import 'package:flutter/material.dart';

class MemberFormWidget extends StatelessWidget {
  const MemberFormWidget({super.key});

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
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFFFC60B),
                      filled: true,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Text('NIK', style: TextStyle(color: Colors.white)),
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
                  const Text('Jenis Kelamin',
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
                  const Text('Tempat Lahir',
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
                  const Text('Tanggal Lahir',
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
                  const Text('Agama', style: TextStyle(color: Colors.white)),
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
                  const Text('Pendidikan',
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
                  const Text('Jenis Pekerjaan',
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
                  const Text('Status Perkawinan',
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
                  const Text('Status Hubungan',
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
                  const Text('Kewarganegaraan',
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
                  const Text('No. Paspor',
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
                  const Text('No. KITAP',
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
                  const Text('Ayah', style: TextStyle(color: Colors.white)),
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
                  const Text('Ibu', style: TextStyle(color: Colors.white)),
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
