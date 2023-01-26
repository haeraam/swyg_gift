import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/item_detail_cubit/item_detail_cubit.dart';
import 'package:swyg/models/auth.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/utils/api.dart';
import 'package:swyg/widgets/category_widget.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.item, this.isVertical = false, this.readOnly = false}) : super(key: key);
  final Item item;
  final bool isVertical;
  final bool readOnly;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool _isLike = false;

  @override
  void initState() {
    super.initState();
    getLise();
  }

  getLise() async {
    _isLike = await Api().checkIsLikedItem(widget.item.productId);
    setState(() {});
  }

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
            imageUrl: widget.item.productImg,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.readOnly) return;
            context.read<ItemDetailCubit>().clear();
            context.go('/item/${widget.item.productId}');
          },
          child: Container(
            width: 124,
            height: 124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: blackB5C),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            if (widget.readOnly) return;
            _isLike = !_isLike;
            Api().changeLikeItem(
              isLike: _isLike,
              memberNm: Auth().memberNm,
              productId: widget.item.productId,
              productMemberNm: widget.item.memberNm,
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

    Widget others = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 124,
          child: Text(
            widget.item.productNm,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.item.memberNm ?? '',
          style: const TextStyle(
            color: blackB3C,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        if (widget.item.categoryNm.isNotEmpty)
          Row(
            children: [
              CategoryWidget(
                title: widget.item.categoryNm[Random().nextInt(widget.item.categoryNm.length)],
                isWhite: widget.isVertical,
              ),
              const SizedBox(width: 4),
              if (widget.item.categoryNm.length > 1)
                CategoryWidget(
                  title: widget.item.categoryNm[Random().nextInt(widget.item.categoryNm.length - 1) + 1],
                  isWhite: widget.isVertical,
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
              '${widget.item.productWcnt}',
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

    return widget.isVertical
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}
