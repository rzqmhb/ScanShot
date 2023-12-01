import 'package:flutter/material.dart';

class CustomMultiselectDropDown extends StatefulWidget {
  final Function(List<String>) selectedList;
  final List<String> listOFStrings;
  final String title;

  CustomMultiselectDropDown({
    required this.selectedList,
    required this.listOFStrings,
    required this.title,
  });

  @override
  _CustomMultiselectDropDownState createState() =>
      _CustomMultiselectDropDownState();
}

class _CustomMultiselectDropDownState extends State<CustomMultiselectDropDown> {
  List<String> listOFSelectedItem = [''];
  String selectedText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listOFStrings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                  item: widget.listOFStrings[index],
                  selected: (val) {
                    selectedText = val;
                    widget.selectedList(listOFSelectedItem);
                    setState(() {});
                  },
                  itemSelected:
                      listOFSelectedItem.contains(widget.listOFStrings[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ViewItem extends StatelessWidget {
  String item;
  bool itemSelected;
  final Function(String) selected;

  _ViewItem({
    required this.item,
    required this.itemSelected,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            item,
            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          ),
        ],
      ),
    );
  }
}
