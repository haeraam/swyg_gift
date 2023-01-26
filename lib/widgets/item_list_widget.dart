import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/list_detail_cubit/list_detail_cubit.dart';
import 'package:swyg/models/auth.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/utils/api.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({
    super.key,
    required this.itemList,
    this.isVertical = false,
    this.readOnly = false,
  });
  final ItemList itemList;
  final bool isVertical;
  final bool readOnly;

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  bool _isLike = false;
  @override
  Widget build(BuildContext context) {
    final img = Stack(
      children: [
        Container(
          width: 124,
          height: 124,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: blackB5C)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 61,
                    height: 61,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(15)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.itemList.products.isNotEmpty
                                ? widget.itemList.products[0].productImg
                                : ''),
                      ),
                    ),
                  ),
                  Container(
                    width: 61,
                    height: 61,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.itemList.products.length > 1
                                ? widget.itemList.products[1].productImg
                                : ''),
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
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.itemList.products.length > 2
                                ? widget.itemList.products[2].productImg
                                : ''),
                      ),
                    ),
                  ),
                  Container(
                    width: 61,
                    height: 61,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.itemList.products.length > 3
                                ? widget.itemList.products[3].productImg
                                : ''),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            if (widget.readOnly) return;
            _isLike = !_isLike;
            Api().changeLikeItemList(
              isLike: _isLike,
              memberNm: Auth().memberNm,
              productId: widget.itemList.productListId,
              productMemberNm: widget.itemList.memberNm,
            );
          }),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 124,
            height: 124,
            alignment: Alignment.topRight,
            child: Icon(
              _isLike ? Icons.favorite : Icons.favorite_border,
              color: _isLike ? primaryC : blackB5C,
            ),
          ),
        )
      ],
    );

    final others = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.itemList.productListNm,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          widget.itemList.memberNm,
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
              '${widget.itemList.productListCnt}',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );

    List<Widget> children = [
      img,
      SizedBox(
        height: widget.isVertical ? 0 : 12,
        width: widget.isVertical ? 14 : 0,
      ),
      others,
    ];
    return GestureDetector(
      onTap: () {
        context.read<ListDetailCubit>().clear();
        context.go('/itemlist/${widget.itemList.productListId}');
      },
      child: widget.isVertical
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
