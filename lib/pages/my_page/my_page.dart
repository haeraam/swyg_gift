import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            '마이페이지',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
          ),
          const SizedBox(height: 45),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: blackB5C),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              WhiteBox(num: '3', title: '등록한 아이템'),
              WhiteBox(num: '1', title: '등록한 리스트'),
              WhiteBox(num: '5', title: 'My PICK'),
            ],
          ),
          const SizedBox(height: 47),
          const WhiteBox2(title: '문의하기'),
          const SizedBox(height: 9),
          const WhiteBox2(title: '로그아웃'),
        ],
      ),
    );
  }
}

class WhiteBox extends StatelessWidget {
  const WhiteBox({super.key, required this.num, required this.title});
  final String num;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 112,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              num,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            ),
            const SizedBox(height: 7),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

class WhiteBox2 extends StatelessWidget {
  const WhiteBox2({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      height: 57,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
      ),
    );
  }
}
