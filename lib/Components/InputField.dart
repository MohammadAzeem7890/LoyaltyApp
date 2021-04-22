import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key key,
      @required this.placeholder,
      this.white = false,
      this.icon,
      this.limit = 0,
      @required this.onChange})
      : super(key: key);

  final String placeholder;
  final bool white;
  final Icon icon;
  final int limit;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextField(
        onChanged: onChange,
        keyboardType: TextInputType.number,
        inputFormatters:
            limit > 0 ? [LengthLimitingTextInputFormatter(limit)] : null,
        style: TextStyle(color: white ? Colors.white : Colors.black),
        decoration: InputDecoration(
          prefixIcon: icon ?? null,
          labelText: placeholder,
          labelStyle: TextStyle(color: white ? Colors.white : Colors.black),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: white ? Colors.white : Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: white ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
