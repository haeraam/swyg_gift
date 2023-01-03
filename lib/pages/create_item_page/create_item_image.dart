import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateItemImage extends StatefulWidget {
  CreateItemImage({Key? key}) : super(key: key);

  @override
  State<CreateItemImage> createState() => _CreateItemImageState();
}

class _CreateItemImageState extends State<CreateItemImage> {
  final List<String> test1 = List.generate(10, (index) => '카테고리$index');

  List choicedCategory = [];
  Image? _img;

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
                  context.go('/createItemName');
                },
                child: const Text('다음',
                    style: TextStyle(
                      color: blackB3C,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ))),
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
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) _img = Image.network(image.path);
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    color: const Color(0xFFF4F4F4),
                    height: 151,
                    child: _img ?? Center(
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
                const TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'url 주소를 입력해 주세요'),
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
