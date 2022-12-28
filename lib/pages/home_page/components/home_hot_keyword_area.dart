import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/best_category_cubit/best_category_cubit.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_list_widget.dart';

class HomeHotKeywordArea extends StatelessWidget {
  const HomeHotKeywordArea({super.key});
  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.watch<BestCategoryCubit>().state.categoryList;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTitle(title: '인기 키워드'),
          const SizedBox(height: 12),
          SizedBox(
            height: 31,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: index == 0 ? blackB1C : blackB5C),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(categories[index].categoryNm,
                        style: TextStyle(
                            color: index == 0 ? blackB1C : blackB5C,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 212,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Row(
                  children: [
                    ItemListWidget(
                      itemList: ItemList(
                          productListId: 'productListId',
                          productListNm: '리스트명',
                          productListCm: 'productListCm',
                          productImg: 'productImg',
                          productCreateDt: DateTime.now(),
                          productUpdateDt: DateTime.now(),
                          mnmberName: '제작자',
                          productId: [],
                          prodictListCnt: '${Random().nextInt(50)}'),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
