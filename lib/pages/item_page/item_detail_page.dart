import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/item_detail_cubit/item_detail_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/category_widget.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key, required this.itemId});
  final String itemId;

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final loadingItem = Item.empty();
  @override
  void initState() {
    super.initState();
    context.read<ItemDetailCubit>().getItem(widget.itemId);
  }

  @override
  Widget build(BuildContext context) {
    Item item = context.watch<ItemDetailCubit>().state.item ?? Item.empty();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.close, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close, color: Colors.black)),
        ],
      ),
      body: PageWrap(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: item.productImg == ''
                    ? Container()
                    : Image.network(
                        item.productImg,
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 26),
                    Row(
                      children: [
                        Text(
                          item.productNm,
                          style: const TextStyle(fontWeight: FontWeight.w600, color: blackB1C, fontSize: 21),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.favorite, color: Colors.red, size: 14),
                        const SizedBox(width: 2),
                        Text(item.productWcnt.toString()),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.memberNm ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w400, color: blackB2C, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item.productCmt,
                      style: const TextStyle(fontWeight: FontWeight.w400, color: blackB3C, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 20,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: item.categoryNm.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            CategoryWidget(
                              title: item.categoryNm[index],
                            ),
                            const SizedBox(width: 8)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '생성일: ${item.productCreateDt.substring(0, min(10, item.productCreateDt.length))}',
                      style: const TextStyle(fontWeight: FontWeight.w400, color: blackB4C, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
