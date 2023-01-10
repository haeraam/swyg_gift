import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/item_detail_cubit/item_detail_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/category_widget.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ItemDetailCubit>().clear();
        context.go('/item/${item.productId}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: item.productImg,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: blackB5C),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 124,
                height: 124,
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.favorite_border,
                  color: blackB5C,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            item.productNm,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            item.memberNm ?? '',
            style: const TextStyle(
              color: blackB3C,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          if (item.categoryNm.isNotEmpty)
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 20,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: const Color(0xFFF4F4F4)),
                  child: Text(
                    item.categoryNm[Random().nextInt(item.categoryNm.length)],
                    style: const TextStyle(color: blackB2C, fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                ),
                const SizedBox(width: 4),
                if (item.categoryNm.length > 1) CategoryWidget(title: item.categoryNm[Random().nextInt(item.categoryNm.length)]),
              ],
            ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.favorite,
                size: 12,
                color: blackB5C,
              ),
              const SizedBox(width: 3),
              Text(
                item.productCmt,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}
