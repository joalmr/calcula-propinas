import 'package:flutter/material.dart';

class IconAction extends StatelessWidget {
  final bool fase;
  const IconAction({super.key, required this.fase});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        fase ? Icons.request_page_rounded : Icons.arrow_back_ios_rounded,
        color: Colors.brown,
        size: 32,
      ),
    );
  }
}
