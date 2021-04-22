import 'package:flutter/material.dart';

Column dropDownList(
    {@required String hint,
    @required String dropdownValue,
    @required List<String> items,
    @required Function onChange,
    bool noUnderline = false,
    bool textBold = false,
    bool removeTopSpace = false,
    bool white = false}) {
  return Column(
    children: <Widget>[
      removeTopSpace
          ? SizedBox()
          : SizedBox(
              height: 10.0,
            ),
      DropdownButton<String>(
        hint: Text(
          hint,
          style: TextStyle(color: white ? Colors.white : Colors.black),
        ),
        value: dropdownValue,
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: white ? Colors.white : Colors.black,
        ),
        iconSize: 24,
        elevation: 1,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: textBold ? FontWeight.bold : FontWeight.normal),
        underline: Container(
          height: 0,
          color: Colors.grey,
        ),
        onChanged: onChange,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      noUnderline
          ? SizedBox()
          : Container(
              height: 1,
              color: white ? Colors.white : Colors.grey,
            )
//
    ],
  );
}
