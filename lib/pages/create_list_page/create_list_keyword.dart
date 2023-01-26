import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:swyg/cubits/create_list_cubit/create_list_cubit.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateListKeyWord extends StatefulWidget {
  const CreateListKeyWord({Key? key}) : super(key: key);

  @override
  State<CreateListKeyWord> createState() => _CreateListKeyWordState();
}

class _CreateListKeyWordState extends State<CreateListKeyWord> {
  late List<Category> choicedCategory;
  bool _isSelected = false;

  @override
  initState() {
    super.initState();
    choicedCategory = (context.read<CreateListCubit>().state.categoryNm ?? <Category>[]);
    _isSelected = choicedCategory.isNotEmpty;
    setState(() {});
  }

  getCategorys(List<Category> categorys) {
    List<Widget> res = [];
    int index = 0;
    List<Widget> rowTmp = [];

    for (var category in categorys) {
      if (index++ % 2 == 0) {
        rowTmp = [
          CategoryCard(
            isChecked: choicedCategory.any((choicedOne) => choicedOne.categoryId == category.categoryId),
            title: category.categoryNm,
            onClick: (bool isSelected) {
              if (isSelected) {
                choicedCategory = [...choicedCategory, category];
              } else {
                choicedCategory = choicedCategory.where((element) => element != category).toList();
              }
              context.read<CreateListCubit>().setCategories(choicedCategory);
              setState(() {
                _isSelected = choicedCategory.isNotEmpty;
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
            isChecked: choicedCategory.any((choicedOne) => choicedOne.categoryId == category.categoryId),
            title: category.categoryNm,
            onClick: (bool isSelected) {
              if (isSelected) {
                choicedCategory = [...choicedCategory, category];
              } else {
                choicedCategory = choicedCategory.where((element) => element != category).toList();
              }
              context.read<CreateListCubit>().setCategories(choicedCategory);
              setState(() {
                _isSelected = choicedCategory.isNotEmpty;
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
    final List<Category> categories = context.read<AllCategoryCubit>().state.categoryList.where((category) => category.categoryCd != '03').toList();

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
                if (_isSelected) context.go('/createListChoiceItem');
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
              context.read<CreateListCubit>().reset();
              context.go('/', extra: 'back');
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
                ...getCategorys(categories),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.title, required this.onClick, this.isChecked});
  final String title;
  final Function onClick;
  final bool? isChecked;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late bool isChecked;
  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
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
            backgroundColor: isChecked ? primary2C : const Color(0xFFF4F4F4),
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
