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
  const ItemWidget({Key? key, required this.item, this.isVertical = false}) : super(key: key);
  final Item item;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    Widget img = Stack(
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
    );

    Widget others = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 124,
          child: Text(
            item.productNm,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
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
        const SizedBox(height: 12),
        if (item.categoryNm.isNotEmpty)
          Row(
            children: [
              CategoryWidget(
                title: item.categoryNm[Random().nextInt(item.categoryNm.length)],
                isWhite: isVertical,
              ),
              const SizedBox(width: 4),
              if (item.categoryNm.length > 1)
                CategoryWidget(
                  title: item.categoryNm[Random().nextInt(item.categoryNm.length - 1) + 1],
                  isWhite: isVertical,
                ),
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
              '${item.productWcnt}',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );

    List<Widget> children = [
      img,
      SizedBox(
        height: isVertical ? 0 : 12,
        width: isVertical ? 14 : 0,
      ),
      others,
    ];

    return GestureDetector(
      onTap: () {
        context.read<ItemDetailCubit>().clear();
        context.go('/item/${item.productId}');
      },
      child: isVertical
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
    );
  }
}
