import 'package:flutter/material.dart';
import 'package:scanshot/widget/multiSelect.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);

  // List<MultiSelectNestedItem> options = [
  //   MultiSelectNestedItem(
  //     id: 1,
  //     name: 'Option 1',
  //     children: [],
  //   ),
  //   MultiSelectNestedItem(
  //     id: 2,
  //     name: 'Option 2 ',
  //     children: [],
  //   ),
  // ];
  // List<MultiSelectNestedItem> selected = [];
  // MultiSelectNestedController multiSelectController =
  //     MultiSelectNestedController();

  Widget textField({required String hintText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          fillColor: Color.fromRGBO(73, 73, 73, 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide:
                BorderSide(color: Color.fromRGBO(110, 110, 110, 1), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide:
                BorderSide(color: Color.fromRGBO(110, 110, 110, 1), width: 2.0),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
                color: Color.fromRGBO(255, 255, 255, 1))),
        title: Text('Pusat Bantuan'),
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 10),
            textField(hintText: 'Cari'),
            CustomMultiselectDropDown(
              selectedList: (list) {},
              listOFStrings: ['scanShot merupakan aplikasi Scan KK'],
              title: 'Apa itu scanShot?',
            ),
            CustomMultiselectDropDown(
              selectedList: (list) {},
              listOFStrings: [
                '1. Buka aplikasi scanShot',
                '2. Klik gambar scan',
                '3. Arahkan kamera ke KK yang ingin di pindai',
                '4. Lihat hasil pindai KK di beranda'
              ],
              title: 'Bagaimana cara menggunakan scanShot?',
            ),
            CustomMultiselectDropDown(
              selectedList: (list) {},
              listOFStrings: ['scanShot merupakan aplikasi Scan KK'],
              title: 'Apa itu scanShot?',
            )
          ],
        ),
      ),
    );
  }
}
