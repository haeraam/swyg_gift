import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/widgets/member_rank_widget.dart';

class HomeMemberRankArea extends StatelessWidget {
  const HomeMemberRankArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTitle(title: '센스만점 제작자'),
          const SizedBox(height: 12),
          SizedBox(
            height: 104,
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
                    MemberRankWidget(
                      item: Item(
                          productId: 0,
                          productNm: '리스트명',
                          productCm: 'productCm',
                          productPrice: '0',
                          productUrl: 'productUrl',
                          productImg: 'productImg',
                          categoryNm: [],
                          productCmt: '',
                          productWcnt: 0,
                          memberNm: '제작자',
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
