import 'package:flutter/material.dart';

class Baliz extends StatelessWidget {
  final size;

  const Baliz({this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 10, color: Colors.green.shade800),
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
