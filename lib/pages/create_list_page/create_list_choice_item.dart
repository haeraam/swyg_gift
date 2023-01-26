import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/create_list_cubit/create_list_cubit.dart';
import 'package:swyg/cubits/my_pick_cubit/my_pick_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_widget.dart';

class CreateListChoiceItem extends StatefulWidget {
  const CreateListChoiceItem({Key? key}) : super(key: key);

  @override
  State<CreateListChoiceItem> createState() => _CreateListChoiceItemState();
}

class _CreateListChoiceItemState extends State<CreateListChoiceItem> {
  List<int> selectedProdectId = [];

  @override
  void initState() {
    super.initState();

    // _itemName = context.read<CreateItemCubit>().state.productNm ?? '';
    // _itemComent = context.read<CreateItemCubit>().state.productCmt ?? '';
    // _itemNemeTextController.text = _itemName;
    // _itemComentTextController.text = _itemComent;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<MyPickCubit>().state.items;

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
                if (selectedProdectId.isNotEmpty) {
                  context.go('/createListName');
                  context.read<CreateListCubit>().setProductListPd(selectedProdectId);
                }
              },
              child: Text(
                '다음',
                style: TextStyle(
                  color: selectedProdectId.isNotEmpty ? primaryC : blackB3C,
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
              context.go('/createListKeyWord', extra: 'back');
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
              children: [
                Row(
                  children: const [
                    Text(
                      'MY PICK',
                      style: TextStyle(
                        fontSize: 17,
                        color: blackB1C,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '2개 이상 선택해 주세요',
                      style: TextStyle(
                        fontSize: 14,
                        color: blackB4C,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      CreateListItemPicker(
                        selected: selectedProdectId.contains(items[index].productId),
                        onTap: () {
                          if (selectedProdectId.contains(index)) {
                            selectedProdectId = selectedProdectId.where((id) => id != items[index].productId).toList();
                          } else {
                            selectedProdectId.add(items[index].productId);
                          }
                          setState(() {});
                        },
                        item: ItemWidget(
                          readOnly: true,
                          isVertical: true,
                          item: items[index],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateListItemPicker extends StatelessWidget {
  const CreateListItemPicker({super.key, required this.item, this.onTap, this.selected = false});
  final Widget item;
  final bool selected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: selected ? primaryC : Colors.white,
        child: Row(
          children: [
            const Icon(Icons.face),
            const SizedBox(
              width: 8,
            ),
            item
          ],
        ),
      ),
    );
  }
}
