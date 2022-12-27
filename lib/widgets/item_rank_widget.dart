import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';

class ItemRankWidget extends StatelessWidget {
  const ItemRankWidget({super.key, required this.item, required this.rank});
  final Item item;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        '${item.productCnt}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: blackB3C,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.memberName!,
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
              decoration: const BoxDecoration(
                color: blackB5C,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
