import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:swyg/cubits/best_category_cubit/best_category_cubit.dart';
import 'package:swyg/cubits/hot_keyword_item_list_cubit/hot_keyword_item_list_cubit.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_list_widget.dart';

class HomeHotKeywordArea extends StatefulWidget {
  const HomeHotKeywordArea({super.key});

  @override
  State<HomeHotKeywordArea> createState() => _HomeHotKeywordAreaState();
}

class _HomeHotKeywordAreaState extends State<HomeHotKeywordArea> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.watch<BestCategoryCubit>().state.categoryList;
    List<ItemList> itemLists = context.watch<HotKeywordItemListCubit>().state.itemLists;
    return BlocListener<BestCategoryCubit, BestCategoryState>(
      listener: (context, state) {
        context.read<HotKeywordItemListCubit>().getItemListByCategory(state.categoryList[0].categoryNm);
      },
      child: Container(
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
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedIndex = index;
                          context.read<HotKeywordItemListCubit>().getItemListByCategory(categories[index].categoryNm);
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: index == selectedIndex ? blackB1C : blackB5C),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Text(categories[index].categoryNm, style: TextStyle(color: index == selectedIndex ? blackB1C : blackB5C, fontSize: 13, fontWeight: FontWeight.w600)),
                        ),
                      ),
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
                  itemCount: itemLists.length,
                  itemBuilder: (context, index) => Row(
                              children: [ItemListWidget(itemList: itemLists[index]), const SizedBox(width: 8)],
                            )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
