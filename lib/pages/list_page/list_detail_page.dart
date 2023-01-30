import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/list_detail_cubit/list_detail_cubit.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/category_widget.dart';
import 'package:swyg/widgets/item_widget.dart';

class ListDetailPage extends StatefulWidget {
  const ListDetailPage({super.key, required this.listId});
  final String listId;

  @override
  State<ListDetailPage> createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  final loadingItem = Item.empty();
  @override
  void initState() {
    super.initState();
    context.read<ListDetailCubit>().getList(widget.listId);
  }

  @override
  Widget build(BuildContext context) {
    ItemList itemList = context.watch<ListDetailCubit>().state.itemList ?? ItemList.empty();
    List<int> randomList = List.generate(itemList.products.length, (index) => index)..shuffle();

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.close, color: Colors.red)),
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
                child: itemList.products.isEmpty
                    ? Container()
                    : Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: CachedNetworkImage(
                                      imageUrl: itemList.products[randomList[0]].productImg,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: randomList.length > 1
                                      ? AspectRatio(
                                          aspectRatio: 1,
                                          child: CachedNetworkImage(
                                            imageUrl: itemList.products[randomList[1]].productImg,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: randomList.length > 2
                                      ? AspectRatio(
                                          aspectRatio: 1,
                                          child: CachedNetworkImage(
                                            imageUrl: itemList.products[randomList[2]].productImg,
                                          ),
                                        )
                                      : Container(),
                                ),
                                Expanded(
                                  child: randomList.length > 3
                                      ? AspectRatio(
                                          aspectRatio: 1,
                                          child: CachedNetworkImage(
                                            imageUrl: itemList.products[randomList[3]].productImg,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                          itemList.productListNm,
                          style: const TextStyle(fontWeight: FontWeight.w600, color: blackB1C, fontSize: 21),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.favorite, color: Colors.red, size: 14),
                        const SizedBox(width: 2),
                        Text(itemList.productListCnt.toString()),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      itemList.memberNm,
                      style: const TextStyle(fontWeight: FontWeight.w400, color: blackB2C, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      itemList.productListCmt,
                      style: const TextStyle(fontWeight: FontWeight.w400, color: blackB3C, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 20,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemList.categoryNm.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            CategoryWidget(
                              title: itemList.categoryNm[index],
                            ),
                            const SizedBox(width: 8)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '생성일: ${itemList.productListCreateDt.substring(0, min(10, itemList.productListCreateDt.length))}',
                      style: const TextStyle(fontWeight: FontWeight.w400, color: blackB4C, fontSize: 12),
                    ),
                    const SizedBox(height: 45),
                    Container(
                      color: const Color(0xFFF4F4F4),
                      child: NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overScroll) {
                          overScroll.disallowIndicator();
                          return true;
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 36),
                            Row(children: [
                              const Text(
                                '아이템',
                                style: TextStyle(
                                  color: blackB4C,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${itemList.products.length}',
                                style: const TextStyle(
                                  color: primaryC,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              )
                            ]),
                            const SizedBox(height: 16),
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: itemList.products.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  ItemWidget(
                                    isVertical: true,
                                    item: itemList.products[index],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
