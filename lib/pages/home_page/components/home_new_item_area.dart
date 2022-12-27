import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/cubits/new_item_cubit/new_item_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/home_page/components/home_title.dart';
import 'package:swyg/widgets/item_widget.dart';

class HomeNewItemArea extends StatelessWidget {
  const HomeNewItemArea({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<NewItemCubit>().state.itemList;
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
                itemCount: items.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    ItemWidget(
                      item: items[index],
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