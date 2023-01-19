import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/item_detail_cubit/item_detail_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';

class ItemRankWidget extends StatelessWidget {
  const ItemRankWidget({super.key, required this.item, required this.rank});
  final Item item;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ItemDetailCubit>().clear();
        context.go('/item/${item.productId}');
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              child: Center(
                  child: Text(
                '$rank',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
              )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        item.productNm,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.favorite,
                        size: 12,
                        color: blackB5C,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${item.productWcnt}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: blackB3C,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.memberNm ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: blackB3C,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 64,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: item.productImg,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
