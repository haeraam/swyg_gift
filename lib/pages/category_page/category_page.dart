import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/theme/color.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final List<String> test1 = List.generate(10, (index) => '누구누구$index');
  final List<String> test2 = List.generate(4, (index) => '어떤선물$index');
  final List<String> test3 = List.generate(5, (index) => '$index만원이내');

  getCategorys(List<Category> categorys) {
    List<Widget> res = [];
    int index = 0;
    List<Widget> rowTmp = [];
    for (var category in categorys) {
      if (index++ % 2 == 0) {
        rowTmp = [CategoryCard(title: category.categoryNm)];
        if (categorys.length == index) {
          rowTmp = [
            ...rowTmp,
            const SizedBox(width: 14),
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
          const SizedBox(width: 14),
          CategoryCard(title: category.categoryNm),
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
    final List<Category> categories = context.watch<AllCategoryCubit>().state.categoryList;
    final whoCategoies = categories.where((element) => element.categoryCd == '01').toList();
    final whatCategoies = categories.where((element) => element.categoryCd == '02').toList();
    final howMuchCategoies = categories.where((element) => element.categoryCd == '03').toList();
    return SingleChildScrollView(
      child: Container(
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: blackB3C),
            ),
            const SizedBox(height: 12),
            Column(children: getCategorys(whoCategoies)),
            const SizedBox(height: 28),
            const Text(
              '어떤 선물은 찾으시나요?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: blackB3C),
            ),
            const SizedBox(height: 12),
            Column(children: getCategorys(whatCategoies)),
            const SizedBox(height: 28),
            const Text(
              '어떤 가격대를 찾으시나요?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: blackB3C),
            ),
            const SizedBox(height: 12),
            Column(children: getCategorys(howMuchCategoies)),
            const SizedBox(height: 12),
          ],
        ),
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
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              size: 16,
              color: blackB2C,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackB2C,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
