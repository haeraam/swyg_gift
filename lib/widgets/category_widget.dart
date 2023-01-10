import 'package:flutter/material.dart';
import 'package:swyg/theme/color.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: const Color(0xFFF4F4F4)),
      child: Text(
        title,
        style: const TextStyle(color: blackB2C, fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}
