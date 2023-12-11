import 'package:flutter/material.dart';
import 'package:scanshot/widget/footer.dart';
import 'package:scanshot/widget/title_form.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            child: TitleFormWidget(),
          ),
          Positioned(
            top: 26,
            left: 26,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/back_icon.png',
                width: 20,
                height: 17,
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
