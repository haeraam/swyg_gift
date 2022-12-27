import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/widgets/item_widget.dart';

class HomeNewItemArea extends StatelessWidget {
  const HomeNewItemArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTitle(title: 'NEW 선물 아이템'),
          const SizedBox(height: 16),
          SizedBox(
            height: 262,
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
                    ItemWidget(
                      item: Item(
                          productId: 0,
                          productNm: '아이템명',
                          productCm: 'productCm',
                          productPrice: 0.toString(),
                          productUrl: 'productUrl',
                          productImg: 'productImg',
                          categoryNm: ['애견인','3만원이내','남자친구','직장인','학생'],
                          productCnt: Random().nextInt(100),
                          productWcnt: 0,
                          memberName: '제작자',
                          productCreateDt: DateTime.now().toString(),
                          productUpdateDt: DateTime.now().toString(),
                          productBestCmt: 'productBestcmt'),
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