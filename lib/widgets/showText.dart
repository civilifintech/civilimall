import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const ShowText({Key? key, required this.text, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
