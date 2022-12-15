import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_list_widget.dart';

class HomeHotKeywordArea extends StatelessWidget {
  const HomeHotKeywordArea({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '인기 키워드',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 31,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: index == 0 ? blackB1C : blackB5C),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text('남자친구',
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
                      item: Item(
                          productId: 'productId',
                          productNm: '리스트명',
                          productCm: 'productCm',
                          productPrice: 0,
                          productUrl: 'productUrl',
                          productImg: 'productImg',
                          categoryNm: [],
                          productCnt: Random().nextInt(100),
                          productWcnt: 0,
                          memberName: '제작자',
                          productCreateDt: DateTime.now(),
                          productUpdateDt: DateTime.now(),
                          productBestcmt: 'productBestcmt'),
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
