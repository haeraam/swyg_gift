import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key, required this.itemList});
  final ItemList itemList;

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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: blackB5C)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 61,
                        height: 61,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(itemList.products.productImg),
                          ),
                        ),
                      ),
                      Container(
                        width: 61,
                        height: 61,
                        decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(topRight: Radius.circular(15))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 61,
                        height: 61,
                        decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))),
                      ),
                      Container(
                        width: 61,
                        height: 61,
                        decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))),
                      ),
                    ],
                  ),
                ],
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
          itemList.productListNm,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          itemList.memberNm,
          style: const TextStyle(
            color: blackB3C,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
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
              '${itemList.productListCnt}',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
