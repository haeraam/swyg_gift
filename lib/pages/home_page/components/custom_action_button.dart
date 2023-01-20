import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swyg/models/auth.dart';
import 'package:swyg/pages/page.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/utils/api.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomActionButton extends StatefulWidget {
  const CustomActionButton({Key? key}) : super(key: key);

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  bool isOpend = false;
  bool showBtn = false;
  double _turns = 0;
  Color bgColor = Colors.black;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (showBtn)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            margin: isOpend ? const EdgeInsets.only(bottom: 106, right: 0) : EdgeInsets.zero,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isOpend ? 1 : 0,
              child: Container(
                width: 131,
                height: 46,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.go('/createItemKeyWord');
                  },
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/fab_button_icon_add_item.png',
                          width: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '아이템 생성',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
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
              child: Container(
                width: 131,
                height: 46,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.go('/createList');
                    // Auth().signOut();
                  },
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/fab_button_icon_add_list.png',
                          width: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '리스트 생성',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        AnimatedRotation(
          duration: const Duration(milliseconds: 300),
          turns: _turns,
          child: FloatingActionButton(
            backgroundColor: bgColor,
            child: Icon(
              Icons.add,
              color: iconColor,
            ),
            onPressed: () {
              if (isOpend) {
                isOpend = false;
                bgColor = Colors.black;
                iconColor = Colors.white;
                _turns = 0 * pi;
                Future.delayed(const Duration(milliseconds: 350), () {
                  showBtn = false;
                  setState(() {});
                });
              } else {
                showBtn = true;
                Future.delayed(const Duration(milliseconds: 100), () {
                  bgColor = Colors.white;
                  iconColor = Colors.black;
                  _turns = 0.02 * 2 * pi;
                  isOpend = true;
                  setState(() {});
                });
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
