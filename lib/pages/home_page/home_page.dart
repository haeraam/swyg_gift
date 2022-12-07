import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text('home page'),
      ),
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
    return Stack(
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
    );
  }
}
