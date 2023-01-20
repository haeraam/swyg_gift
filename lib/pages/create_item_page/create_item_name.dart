import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/create_item_cubit/create_item_cubit.dart';
import 'package:swyg/models/auth.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/pages/create_item_page/create_item_preview.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateItemName extends StatefulWidget {
  const CreateItemName({Key? key}) : super(key: key);

  @override
  State<CreateItemName> createState() => _CreateItemNameState();
}

class _CreateItemNameState extends State<CreateItemName> {
  String _itemName = '';
  String _itemComent = '';
  final TextEditingController _itemNemeTextController = TextEditingController();
  final TextEditingController _itemComentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _itemName = context.read<CreateItemCubit>().state.productNm ?? '';
    _itemComent = context.read<CreateItemCubit>().state.productCmt ?? '';
    _itemNemeTextController.text = _itemName;
    _itemComentTextController.text = _itemComent;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categoryNm = context.read<CreateItemCubit>().state.categoryNm ?? <Category>[];
    Uint8List? image = context.read<CreateItemCubit>().state.image;

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
                if (_itemNemeTextController.text.isNotEmpty && _itemComentTextController.text.isNotEmpty) {
                  context.go('/createItemPrice');
                  context.read<CreateItemCubit>().setItemName(_itemName);
                  context.read<CreateItemCubit>().setComent(_itemComent);
                }
              },
              child: Text(
                '다음',
                style: TextStyle(
                  color: (_itemNemeTextController.text.isNotEmpty && _itemComentTextController.text.isNotEmpty) ? primaryC : blackB3C,
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
              context.go('/createItemImage', extra: 'back');
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
                  memberName: Auth().memberNm,
                  itemName: _itemName,
                  categories: categoryNm,
                  coment: _itemComent,
                ),
                const SizedBox(height: 30),
                const Text(
                  '아이템명',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      onChanged: (s) {
                        _itemName = s;
                        setState(() {});
                      },
                      controller: _itemNemeTextController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: blackB5C)),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(),
                        labelText: '아이템 명을 입력해 주세요',
                        labelStyle: TextStyle(color: blackB5C),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '9자이내',
                          style: TextStyle(color: primaryC, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  '아이템 소개글',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      onChanged: (s) {
                        _itemComent = s;
                        setState(() {});
                      },
                      controller: _itemComentTextController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: blackB5C)),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(),
                        labelText: '소개글을 입력해 주세요',
                        labelStyle: TextStyle(color: blackB5C),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '20자이내',
                          style: TextStyle(color: primaryC, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        )
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
