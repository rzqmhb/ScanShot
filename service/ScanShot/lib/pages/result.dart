import 'package:flutter/material.dart';
import 'package:scanshot/widget/footer.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF252525),
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}
