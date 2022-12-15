import 'package:flutter/material.dart';
import 'package:swyg/theme/color.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        const Text(
          '전체보기',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: blackB4C),
        ),
      ],
    );
  }
}
