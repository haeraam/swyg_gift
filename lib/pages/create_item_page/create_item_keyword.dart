import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateItemKeyWord extends StatefulWidget {
  CreateItemKeyWord({Key? key}) : super(key: key);

  @override
  State<CreateItemKeyWord> createState() => _CreateItemKeyWordState();
}

class _CreateItemKeyWordState extends State<CreateItemKeyWord> {
  final List<String> test1 = List.generate(10, (index) => '카테고리$index');
  List choicedCategory = [];
  bool _isSelected = false;

  getCategorys(List<String> categorys) {
    List<Widget> res = [];
    int index = 0;
    List<Widget> rowTmp = [];
    for (var category in categorys) {
      if (index++ % 2 == 0) {
        rowTmp = [
          CategoryCard(
            title: category,
            onClick: (bool isSelected) {
              if (isSelected) {
                choicedCategory = [...choicedCategory, category];
              } else {
                choicedCategory = choicedCategory.where((element) => element != category).toList();
              }
              setState(() {
                _isSelected = categorys.isNotEmpty;
              });
            },
          )
        ];
        if (categorys.length == index) {
          rowTmp = [
            ...rowTmp,
            const SizedBox(width: 14),
            Expanded(child: Container()),
          ];
          res = [
            ...res,
            const SizedBox(height: 8),
            Row(
              children: rowTmp,
            )
          ];
        }
      } else {
        rowTmp = [
          ...rowTmp,
          const SizedBox(width: 14),
          CategoryCard(
            title: category,
            onClick: (bool isSelected) {
              if (isSelected) {
                choicedCategory = [...choicedCategory, category];
              } else {
                choicedCategory = choicedCategory.where((element) => element != category).toList();
              }
              setState(() {
                _isSelected = categorys.isNotEmpty;
              });
            },
          ),
        ];
        res = [
          ...res,
          const SizedBox(height: 8),
          Row(
            children: rowTmp,
          )
        ];
      }
    }
    return res;
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
            '대표키워드 검색',
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
                context.go('/createItemImage');
              },
              child: Text(
                '다음',
                style: TextStyle(
                  color: _isSelected ? primaryC : blackB3C,
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
              context.go('/',extra: 'back');
            },
            icon: const Icon(Icons.close),
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
                      '키워드 선택',
                      style: TextStyle(
                        fontSize: 17,
                        color: blackB1C,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '1개 이상 선택해 주세요',
                      style: TextStyle(
                        fontSize: 14,
                        color: blackB4C,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                ...getCategorys(test1),
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
            backgroundColor: isChecked ? primary2C : Color(0xFFF4F4F4),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: isChecked ? primaryC : blackB2C,
                ),
                const SizedBox(width: 4),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: isChecked ? primaryC : blackB2C,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.check_circle,
                  size: 16,
                  color: isChecked ? primaryC : blackB5C,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
