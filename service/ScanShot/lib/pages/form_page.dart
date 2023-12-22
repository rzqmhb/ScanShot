import 'package:flutter/material.dart';
import 'package:scanshot/models/kartu_keluarga.dart';
import 'package:scanshot/widget/footer.dart';
import 'package:scanshot/widget/form_widget.dart';
import 'package:scanshot/widget/member_form_widget.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    final kartuKeluarga =
        ModalRoute.of(context)!.settings.arguments as KartuKeluarga;
    final anggota = kartuKeluarga.anggotaKeluarga;
    final ScrollController _controller = PrimaryScrollController.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF252525),
        title: const Text(
          'Detail Form',
          style: TextStyle( 
            fontSize: 32,
            color: Color(0xFFFFC60B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       child: SingleChildScrollView(
      //         child: Padding(
      //           padding: const EdgeInsets.only(bottom: 128.0),
      //           child: Column(
      //             children: <Widget>[
      //               FormWidget(kartuKeluarga: kartuKeluarga),
      //               const SizedBox(height: 20),
      //               MemberFormWidget(anggotaKeluarga: anggota),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     const Positioned(
      //       child: FooterWidget(),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 128.0),
              child:  ListView(
                controller: _controller,
                children: [
                  FormWidget(kartuKeluarga: kartuKeluarga),
                  const SizedBox(height: 20),
                  MemberFormWidget(anggotaKeluarga: anggota, scrollController: _controller),
                ],
              ),
            ),
          ),
          const Positioned(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}
