import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/list_detail_cubit/list_detail_cubit.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/theme/color.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key, required this.itemList});
  final ItemList itemList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ListDetailCubit>().clear();
        context.go('/itemlist/${itemList.productListId}');
      },
      child: Column(
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
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(itemList.products.isNotEmpty ? itemList.products[0].productImg : ''),
                            ),
                          ),
                        ),
                        Container(
                          width: 61,
                          height: 61,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(15)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(itemList.products.length >1 ? itemList.products[1].productImg : ''),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 61,
                          height: 61,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(itemList.products.length >2 ? itemList.products[2].productImg : ''),
                            ),
                          ),
                        ),
                        Container(
                          width: 61,
                          height: 61,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(itemList.products.length >3 ? itemList.products[3].productImg : ''),
                            ),
                          ),
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
      ),
    );
  }
}
