import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final ValueChanged<bool?> onCheckboxChanged;
  CheckBoxWidget({super.key, required this.onCheckboxChanged});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Widget checkBox = Checkbox(
      checkColor: Colors.black,
      activeColor: Colors.white,
      side: BorderSide(color: Color.fromARGB(255, 255, 198, 11)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
        widget.onCheckboxChanged(value);
      },
    );

    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: checkBox,
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
}
