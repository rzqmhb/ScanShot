import 'package:flutter/material.dart';
import 'package:scanshot/widget/image_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Mengatur input dari input username dan password
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Metode _login() untuk melakukan pemanggilan pada button 'Masuk' yang mengembalikan pada variabel username dan password
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Mengarahkan ke laman home tanpa melakukan pengecekan
    Navigator.pushReplacementNamed(context, '/');
  }

  // Metode untuk melakukan navigasi ke laman home
  void _navigateToHome() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Masuk'),
        backgroundColor: Color(0xFF252525),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Widget untuk mengelola form menggunakan plugin
          child: FormBuilder(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Memberi jarak
                SizedBox(height: 10),

                // Memanggil MyImageWidget() pada image_widget.dart
                MyImageWidget(),

                // Memberi jarak
                SizedBox(height: 20),

                // Menambahkan text dengan style berikut
                Text(
                  'Silakan masukkan nama pengguna dan kata sandi Anda',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Memberi jarak
                SizedBox(height: 20),

                // Mengambil input pada kolom Username
                FormBuilderTextField(
                  name: 'username',
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFFFFC60B)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFFFFC60B)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),

                // Memberi jarak
                SizedBox(height: 20),

                // Mengambil input pada kolom password
                FormBuilderTextField(
                  name: 'password',
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFFFFC60B)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFFFFC60B)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),

                // memberi jarak
                SizedBox(height: 10),

                // Membuat teks 'Lupa sandi' agar dapat menuju laman lain
                InkWell(
                  onTap: _navigateToHome,
                  child: Row(
                    children: [
                      Text(
                        'Lupa Sandi',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: Color(0xFFFFC60B),
                        ),
                      ),
                    ],
                  ),
                ),

                // Memberi jarak
                SizedBox(height: 20),

                // Menambahkan button login dan mengarahkan ke laman berikutnya
                ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    'Masuk',
                    style: TextStyle(color: Color(0xFF252525)),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFC60B),
                  ),
                ),

                // Memberi jarak
                SizedBox(height: 20),

                Text(
                  'Belum punya akun?',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),

                // Memberi jarak
                SizedBox(height: 10),

                // Membuat teks 'Daftar disinii' agar dapat menuju laman lain
                InkWell(
                  onTap: _navigateToHome,
                  child: Text(
                    'Daftar disini',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Color(0xFFFFC60B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



















// // Frontend UTS
// import 'package:flutter/material.dart';
// import 'package:scanshot/basic_widgets/image_widget.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({
//     Key ? key
//   }): super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// // Mengatur input dari input username dan password
// class _LoginPageState extends State < LoginPage > {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   // Metode _login() untuk melakukan pemanggilan pada button 'Masuk' yang mengembalikan pada variabel username dan password
//   void _login() {
//     String username = _usernameController.text;
//     String password = _passwordController.text;

//     // Mengarahkan ke laman home tanpa melakukan pengecekan
//     Navigator.pushReplacementNamed(context, '/scanPreview');
//   }

//   // Metode untuk melakukan navigasi ke laman home
//   void _navigateToHome() {
//     Navigator.pushNamed(context, '/scanPreview');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF252525),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Masuk'),
//         backgroundColor: Color(0xFF252525),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Memberi jarak
//                 SizedBox(height: 10),

//                 // Memanggil MyImageWidget() pada image_widget.dart
//                 MyImageWidget(),

//                 // Memberi jarak
//                 SizedBox(height: 20),

//                 // Menambahkan text dengan style berikut
//                 Text(
//                   'Silakan masukkan nama pengguna dan kata sandi Anda',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'Inter',
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 // Memberi jarak
//                 SizedBox(height: 20),

//                 // Kolom Nama Pengguna dengan style berikut
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     labelText: 'Nama Pengguna',
//                     labelStyle: TextStyle(color: Colors.white),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Color(0xFFFFC60B)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Color(0xFFFFC60B)),
//                     ),
//                   ),
//                   style: TextStyle(color: Colors.white), // Menambahkan properti style
//                 ),

//                 // Memberi jarak
//                 SizedBox(height: 20),

//                 // Kolom Kata Sandi  dengan style berikut
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Kata Sandi',
//                     labelStyle: TextStyle(color: Colors.white),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Color(0xFFFFC60B)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Color(0xFFFFC60B)),
//                     ),
//                   ),
//                   style: TextStyle(color: Colors.white), // Menambahkan properti style
//                   obscureText: true,
//                 ),


//                 // Memberi jarak
//                 SizedBox(height: 10),

//                 // Menambahkan text dengan navigasi menuju laman daftar
//                 InkWell(
//                   // Mengembalikan pemanggilan ke metode _navigateToHome
//                   onTap: _navigateToHome,
//                   child: Row(
//                     children: [
//                       Text(
//                         'Lupa Sandi',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontFamily: 'Inter',
//                           color: Color(0xFFFFC60B),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Memberi jarak
//                 SizedBox(height: 20),

//                 // Tampilan button 'Masuk' yang mengembalikan nilai ke metode _login() saat dipanggil
//                 ElevatedButton(
//                   // Mengembalikan pemanggilan ke metode _login
//                   onPressed: _login,
//                   child: Text(
//                     'Masuk',
//                     style: TextStyle(color: Color(0xFF252525)),
//                     textAlign: TextAlign.center,
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFFFC60B),
//                   ),
//                 ),

//                 // Memberi jarak
//                 SizedBox(height: 20),

//                 // Menambahkan text dengan style berikut
//                 Text(
//                   'Belum punya akun?',
//                   style: TextStyle(fontSize: 16, color: Colors.white, ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),

//                 // Menambahkan text dengan navigasi menuju laman daftar
//                 InkWell(
//                   // Mengembalikan pemanggilan ke metode _navigateToHome
//                   onTap: _navigateToHome,
//                   child: Text(
//                     'Daftar disini',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: 'Inter',
//                       color: Color(0xFFFFC60B),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//         ),
//       ),
//     );
//   }
// }

















//// Menggunakan Pengecekkan
// import 'package:flutter/material.dart';
// import 'package:login/basic_widgets/image_widget.dart';


// class LoginPage extends StatefulWidget {
//   LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _login() {
//     // Implementasi Login
//     String username = _usernameController.text;
//     String password = _passwordController.text;

//     // Melakukan cek kebenaran username dan password
//     if (username == 'your_username' && password == 'your_password') {
//       // Mengarahkan ke laman home sebagai aksi sukses login
//       Navigator.pushReplacementNamed(context, '/home');
//     } else {
//       // Display an error message or handle authentication failure
//       // For example, you can show a SnackBar with an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Invalid username or password'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MyImageWidget(),
//             // Memberi Jarak
//             SizedBox(height: 10),
//             Text(
//               'Mohon masukkan nama pengguna dan kata sandi anda',
//               style: TextStyle(fontSize: 16),
//             ), // Menampilkan gambar pada laman login
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }