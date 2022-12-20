import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/cubit/item_list_cubit.dart';
import 'package:swyg/dummy/testData.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/theme/color.dart';

class CreateItemPrice extends StatelessWidget {
  CreateItemPrice({Key? key}) : super(key: key);
  final List<String> test1 = List.generate(10, (index) => '카테고리$index');
  List choicedCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96,
        backgroundColor: blackB1C,
        title: Container(
          padding: const EdgeInsets.only(top: 50),
          child: const Text(
            '아이템 생성하기',
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
                context.go('/');
              },
              child: const Text(
                '완료',
                style: TextStyle(
                  color: blackB3C,
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
                Container(
                  color: const Color(0xFFF4F4F4),
                  height: 151,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '미리보기',
                          style: TextStyle(color: blackB5C, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  '아이템 명',
                  style: TextStyle(
                    fontSize: 17,
                    color: blackB1C,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '아이템 명을 입력해 주세요',
                  ),
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
                          title: '3만원 이내',
                          onClick: () {},
                        ),
                        const SizedBox(width: 8),
                        PriceCard(
                          title: '5만원 이내',
                          onClick: () {},
                        ),
                        const SizedBox(width: 8),
                        PriceCard(
                          title: '10만원 이내',
                          onClick: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        PriceCard(
                          title: '20만원 이내',
                          onClick: () {},
                        ),
                        const SizedBox(width: 8),
                        PriceCard(
                          title: '20만원 이상',
                          onClick: () {},
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
  const PriceCard({super.key, required this.title, required this.onClick});
  final String title;
  final Function onClick;

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
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
            side: BorderSide(width: 1, color: isChecked ? primaryC : blackB2C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: isChecked ? primary2C : Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isChecked ? FontWeight.w500 : FontWeight.w400,
                  color: isChecked ? primaryC : blackB2C,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
