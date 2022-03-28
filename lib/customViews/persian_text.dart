import 'package:flutter/material.dart';

class PersianTextView extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final Color? fontColor;

  const PersianTextView({Key? key, this.title, this.fontSize, this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        '${title}',
        style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
            fontFamily: 'IRANSans'),

    );
  }

  }