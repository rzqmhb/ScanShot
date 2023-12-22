import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GantiUsername extends StatefulWidget {
  GantiUsername({super.key});

  @override
  State<GantiUsername> createState() => _GantiUsernameState();
}

class _GantiUsernameState extends State<GantiUsername> {
  final user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();

  void _updateUsername() async {
    if (_formKey.currentState!.validate()) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(_displayNameController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Nama tampilan berhasil diperbarui!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/informasiAkun');
          },
          child: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        title: Text('Ubah Nama Pengguna'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(73, 73, 73, 1),
                  border: Border.all(
                    color: Color.fromRGBO(110, 110, 110, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  title: TextFormField(
                    controller: _displayNameController,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: '${user.displayName}',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan Nama Pengguna Baru';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  fixedSize: Size(100, 35),
                  backgroundColor: Color.fromARGB(255, 255, 198, 11),
                ),
                onPressed: () async {
                  _updateUsername();
                },
                child: Text(
                  'KONFIRMASI',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
