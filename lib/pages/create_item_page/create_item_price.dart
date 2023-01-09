import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:swyg/cubits/create_item_cubit/create_item_cubit.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/pages/create_item_page/create_item_preview.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/utils/api.dart';

class CreateItemPrice extends StatefulWidget {
  CreateItemPrice({Key? key}) : super(key: key);

  @override
  State<CreateItemPrice> createState() => _CreateItemPriceState();
}

class _CreateItemPriceState extends State<CreateItemPrice> {
  final List<String> test1 = List.generate(10, (index) => '카테고리$index');
  int selectedIndex = -1;
  Uint8List? test;

  @override
  Widget build(BuildContext context) {
    List<Category> categoryNm = context.read<CreateItemCubit>().state.categoryNm ?? <Category>[];
    Uint8List? image = context.read<CreateItemCubit>().state.image;
    String itemName = context.read<CreateItemCubit>().state.productNm ?? '';
    String itemComent = context.read<CreateItemCubit>().state.productCmt ?? '';
    String url = context.read<CreateItemCubit>().state.productUrl ?? '';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96,
        backgroundColor: blackB1C,
        title: Container(
          padding: const EdgeInsets.only(top: 50),
          child: const Text(
            '아이템 정보 입력',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () {
                if (selectedIndex != -1) {
                  context.go('/');
                  context.read<CreateItemCubit>().createItem(
                        image: image,
                        productNm: itemName,
                        productCmt: itemComent,
                        productPrice: 'productPrice',
                        productUrl: url,
                        catrgoryNm: categoryNm.map((e) => e.categoryNm).toList(),
                        memberNm: '테스터',
                      );
                }
              },
              child: Text(
                '완료',
                style: TextStyle(
                  color: selectedIndex != -1 ? primaryC : blackB3C,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
        leading: Container(
          padding: const EdgeInsets.only(top: 50),
          child: IconButton(
            onPressed: () {
              context.go('/createItemName', extra: 'back');
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
      ),
      body: PageWrap(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '미리보기',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                CreateItemPreview(
                  image: image,
                  memberName: '테스트',
                  itemName: itemName,
                  categories: categoryNm,
                  coment: itemComent,
                ),
                const SizedBox(height: 30),
                const Text(
                  '가격대',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    Row(
                      children: [
                        PriceCard(
                          isChecked: selectedIndex == 0,
                          title: '3만원 이내',
                          onClick: () {
                            selectedIndex = 0;
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 8),
                        PriceCard(
                          isChecked: selectedIndex == 1,
                          title: '5만원 이내',
                          onClick: () {
                            selectedIndex = 1;
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 8),
                        PriceCard(
                          isChecked: selectedIndex == 2,
                          title: '10만원 이내',
                          onClick: () {
                            selectedIndex = 2;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        PriceCard(
                          isChecked: selectedIndex == 3,
                          title: '20만원 이내',
                          onClick: () {
                            selectedIndex = 3;
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 8),
                        PriceCard(
                          isChecked: selectedIndex == 4,
                          title: '20만원 이상',
                          onClick: () {
                            selectedIndex = 4;
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Container())
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PriceCard extends StatefulWidget {
  const PriceCard({super.key, required this.title, required this.onClick, required this.isChecked});
  final String title;
  final void Function() onClick;
  final bool isChecked;

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: widget.onClick,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(width: 1, color: widget.isChecked ? primaryC : blackB2C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: widget.isChecked ? primary2C : Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: widget.isChecked ? FontWeight.w500 : FontWeight.w400,
                  color: widget.isChecked ? primaryC : blackB2C,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
