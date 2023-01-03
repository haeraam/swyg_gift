import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/weekly_bset_item_cubit/weekly_bset_item_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/widgets/item_rank_widget.dart';

class HomeWeeklyItemRankArea extends StatelessWidget {
  const HomeWeeklyItemRankArea({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = context.watch<WeeklyBsetItemCubit>().state.itemList;
    int rank = 1;
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
            ...items.map((item) => Column(
                  children: [
                    ItemRankWidget(item: item, rank: rank++),
                    const SizedBox(height: 8),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
