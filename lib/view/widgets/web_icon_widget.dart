import 'package:cyberdoctor/utils/links.dart';
import 'package:flutter/material.dart';

class WebIconWidget extends StatelessWidget {
  final String filename;
  final int height;
  final int width;

  const WebIconWidget({
    Key? key,
    required this.filename,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Image.network(Links.categoryicon + filename),
    );
  }
}
