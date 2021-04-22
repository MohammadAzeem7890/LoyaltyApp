import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key key, @required this.text, this.size, this.color, this.weight})
      : super(key: key);

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 36.0,
          fontWeight: weight ?? FontWeight.bold,
          color: color ?? Colors.black),
    );
  }
}
