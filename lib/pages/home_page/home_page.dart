import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/cubit/item_list_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<ItemListCubit>().state.itemList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                context.go('/mypage');
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: BlocListener<ItemListCubit, ItemListState>(
          listener: (context, state) {},
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  '고양이 키우는 지인에게',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 150,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          ItemWidget(name: '아이템$index', isFocused: index == 0),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Hot 키워드',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 150,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          ItemWidget(name: '아이템$index'),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
      floatingActionButton: CustomActionButton(),
    );
  }
}

class CustomActionButton extends StatefulWidget {
  CustomActionButton({Key? key}) : super(key: key);

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  bool isOpend = false;
  bool showBtn = false;

  @override
  Widget build(BuildContext context) {
    return PageWrap(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (showBtn)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              margin: isOpend ? const EdgeInsets.only(bottom: 115, right: 0) : EdgeInsets.zero,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isOpend ? 1 : 0,
                child: FloatingActionButton.extended(
                  heroTag: "addItem",
                  label: const Text('아이템 추가'),
                  backgroundColor: Colors.black,
                  onPressed: () {
                    context.go('/createItem');
                  },
                ),
              ),
            ),
          if (showBtn)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              margin: isOpend ? const EdgeInsets.only(bottom: 60, right: 0) : EdgeInsets.zero,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isOpend ? 1 : 0,
                child: FloatingActionButton.extended(
                  heroTag: "addList",
                  label: const Text(
                    '리스트 추가',
                    style: TextStyle(),
                  ),
                  backgroundColor: Colors.black,
                  onPressed: () {
                    context.go('/createList');
                  },
                ),
              ),
            ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
            onPressed: () {
              if (isOpend) {
                isOpend = false;
                Future.delayed(const Duration(milliseconds: 350), () {
                  showBtn = false;
                  setState(() {});
                });
              } else {
                showBtn = true;
                Future.delayed(const Duration(milliseconds: 100), () {
                  isOpend = true;
                  setState(() {});
                });
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
