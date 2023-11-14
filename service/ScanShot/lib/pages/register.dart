import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scanshot/widget/checkBox.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget icon = Image.asset(
    'assets/images/registerIcon.png',
    width: 200,
    height: 200,
  );

  Widget textField({required String hintText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: TextField(
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 198, 11), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 198, 11), width: 2.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget checkBox() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CheckBoxWidget(),
          ),
          Text(
            'Saya telah menyetujui ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
          ),
          Text(
            'syarat & ketentuan',
            style: TextStyle(
                color: Colors.blue[200],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                fontSize: 11),
          )
        ],
      ),
    );
  }

  Widget textLogin(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Text(
          'Sudah punya akun?',
          style: TextStyle(color: Colors.white),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Login disini',
            style: TextStyle(color: Color.fromARGB(255, 255, 198, 11)),
          ),
        )
      ],
    ),
  );
  }

  bool isLoading = false;
  Widget loading() {
    return Stack(
      children: [
        RegisterPage(),
        Positioned.fill(
            child: Center(
          child: Container(
              padding: EdgeInsets.all(8.0),
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Color.fromARGB(255, 255, 198, 11), size: 100)),
        )),
      ],
      // child:
    );
  }

  Widget buttonRegister(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 58),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(horizontal: 40),
            fixedSize: Size(800, 35),
            backgroundColor: Color.fromARGB(255, 255, 198, 11)),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            isLoading = false;
          });
          Navigator.pushNamed(context, '/');
        },
        child: Text(
          'REGISTRASI',
          style: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loading()
        : MaterialApp(
            title: 'Flutter layout demo',
            home: Scaffold(
              backgroundColor: Color.fromARGB(255, 37, 37, 37),
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 37, 37, 37),
                title: const Text(
                  'Daftar Akun',
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      icon,
                      textField(hintText: 'Nama Pengguna'),
                      textField(hintText: 'Surel'),
                      textField(hintText: 'Kata Sandi'),
                      textField(hintText: 'Konfirmasi Kata Sandi'),
                      checkBox(),
                      buttonRegister(context),
                      textLogin(context),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

// class loading extends StatelessWidget {
//   const loading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//             child:
//                 LoadingAnimationWidget.waveDots(color: Colors.blue, size: 100)),
//       ),
//     );
//   }
// }
