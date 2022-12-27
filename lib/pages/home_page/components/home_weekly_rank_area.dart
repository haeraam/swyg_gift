import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/widgets/item_rank_widget.dart';

class HomeWeeklyItemRankArea extends StatelessWidget {
  const HomeWeeklyItemRankArea({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTitle(title: '주간 아이템 랭킹'),
            const SizedBox(height: 12),
            ...List.generate(
              5,
              (index) => Column(
                children: [
                  ItemRankWidget(
                    rank: index + 1,
                    item: Item(
                        productId: 0,
                        productNm: '아이템명',
                        productCm: 'productCm',
                        productPrice: '0',
                        productUrl: 'productUrl',
                        productImg: 'productImg',
                        categoryNm: [],
                        productCnt: Random().nextInt(100),
                        productWcnt: 0,
                        memberName: '제작자',
                        productCreateDt: DateTime.now().toString(),
                        productUpdateDt: DateTime.now().toString(),
                        productBestCmt: 'productBestcmt'),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
