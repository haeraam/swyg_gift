import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
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
            const SizedBox(height: 28),
            const Text(
              '주간 아이템 랭킹',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ...List.generate(
              5,
              (index) => Column(
                children: [
                  ItemRankWidget(
                    rank: index + 1,
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
