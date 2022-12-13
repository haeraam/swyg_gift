import 'package:flutter/material.dart';
import 'package:swyg/theme/color.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final List<String> test1 = List.generate(10, (index) => '누구누구$index');
  final List<String> test2 = List.generate(4, (index) => '어떤선물$index');
  final List<String> test3 = List.generate(5, (index) => '$index만원이내');

  getCategorys(List<String> categorys) {
    List<Widget> res = [];
    int index = 0;
    List<Widget> rowTmp = [];
    for (var category in categorys) {
      if (index++ % 2 == 0) {
        rowTmp = [CategoryCard(title: category)];
        if (categorys.length == index) {
          rowTmp = [
            ...rowTmp,
            const SizedBox(width: 4),
            Expanded(child: Container()),
          ];
          res = [
            ...res,
            const SizedBox(height: 8),
            Row(
              children: rowTmp,
            )
          ];
        }
      } else {
        rowTmp = [
          ...rowTmp,
          const SizedBox(width: 4),
          CategoryCard(title: category),
        ];
        res = [
          ...res,
          const SizedBox(height: 8),
          Row(
            children: rowTmp,
          )
        ];
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F4F4),
      padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '카테고리',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '전체보기',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: blackB5C,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            '누구에게 주는 선물인가요?',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: blackB3C),
          ),
          const SizedBox(height: 12),
          Column(children: getCategorys(test1)),
          const SizedBox(height: 28),
          const Text(
            '어떤 선물은 찾으시나요?',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: blackB3C),
          ),
          const SizedBox(height: 12),
          Column(children: getCategorys(test2)),
          const SizedBox(height: 28),
          const Text(
            '어떤 가격대를 찾으시나요?',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: blackB3C),
          ),
          const SizedBox(height: 12),
          Column(children: getCategorys(test3)),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              size: 16,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
