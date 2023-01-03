import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swyg/cubits/create_item_cubit/create_item_cubit.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateItemImage extends StatefulWidget {
  CreateItemImage({Key? key}) : super(key: key);

  @override
  State<CreateItemImage> createState() => _CreateItemImageState();
}

class _CreateItemImageState extends State<CreateItemImage> {
  final List<String> test1 = List.generate(10, (index) => '카테고리$index');

  XFile? _img;
  String? _url;
  bool isImageSelected = false;
  bool filledTextField = false;
  final TextEditingController _textEditingController = TextEditingController();

  initState() {
    _img = context.read<CreateItemCubit>().state.image;
    _url = context.read<CreateItemCubit>().state.productUrl;
    isImageSelected = _img != null;
    filledTextField = _url != null;
    _textEditingController.text = _url ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                if ((isImageSelected && filledTextField)) {
                  context.read<CreateItemCubit>().setImages(_img!);
                  context.read<CreateItemCubit>().setUrl(_url!);
                  context.go('/createItemName');
                }
              },
              child: Text(
                '다음',
                style: TextStyle(
                  color: (isImageSelected && filledTextField) ? primaryC : blackB3C,
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
              context.go('/createItemKeyWord', extra: 'back');
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
                  '대표 이미지 등록',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    _img = await picker.pickImage(source: ImageSource.gallery);
                    if (_img != null) {
                      isImageSelected = true;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 151,
                    alignment: Alignment.center,
                    child: isImageSelected
                        ? SizedBox(
                            width: 151,
                            height: 151,
                            child: Image.network(
                              _img!.path,
                              fit: BoxFit.cover,
                            ),
                            //     child: Image.file(
                            //   File(_img!.path),
                            //   fit: BoxFit.cover,
                            // ),
                          )
                        : Container(
                            color: const Color(0xFFF4F4F4),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: blackB5C,
                                    size: 24,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '이미지를 등록해 주세요',
                                    style: TextStyle(color: blackB5C, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  '상품 링크',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _textEditingController,
                  onChanged: (s) {
                    filledTextField = s.isNotEmpty;
                    _url = s;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: OutlineInputBorder(),
                    labelText: 'url 주소를 입력해 주세요',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.title, required this.onClick});
  final String title;
  final Function onClick;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isChecked = !isChecked;
            });
            widget.onClick(isChecked);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: isChecked ? Colors.blue : Color(0xFFF4F4F4),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: isChecked ? Colors.white : blackB2C,
                ),
                const SizedBox(width: 4),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: isChecked ? Colors.white : blackB2C,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.check_circle,
                  size: 16,
                  color: isChecked ? Colors.white : blackB5C,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
