import 'package:flutter/material.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';

class MemberRankWidget extends StatelessWidget {
  const MemberRankWidget({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 104,
      decoration: BoxDecoration(color: blackB5C, borderRadius: BorderRadius.circular(52)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.memberNm!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  size: 12,
                  color: Colors.white,
                ),
                Text(
                  item.productCmt,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
