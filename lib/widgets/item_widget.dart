import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
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
              child: const Icon(Icons.favorite_border,color: blackB5C,),
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
          item.memberName,
          style: const TextStyle(
            color: blackB3C,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              height: 20,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(3), color: const Color(0xFFF4F4F4)),
              child: Text(
                item.categoryNm[Random().nextInt(5)],
                style: TextStyle(color: blackB2C, fontWeight: FontWeight.w500, fontSize: 10),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.all(4),
              height: 20,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(3), color: const Color(0xFFF4F4F4)),
              child: Text(
                item.categoryNm[Random().nextInt(5)],
                style: TextStyle(color: blackB2C, fontWeight: FontWeight.w500, fontSize: 10),
              ),
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
              '${item.productCnt}',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
