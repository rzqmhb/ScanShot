import 'package:flutter/material.dart';
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
      body: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 128.0),
                child: Column(
                  children: <Widget>[
                    FormWidget(),
                    const SizedBox(height: 20),
                    const MemberFormWidget(),
                    // ListView.builder(
                    //   itemCount: members.length,
                    //   itemBuilder: (context, index) {
                    //     return MemberFormWidget(member: members[index]);
                    //   },
                    // ),
                  ],
                ),
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
