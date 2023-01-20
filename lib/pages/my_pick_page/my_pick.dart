import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/page.dart';
import 'package:swyg/utils/api.dart';

class MyPick extends StatefulWidget {
  const MyPick({Key? key}) : super(key: key);

  @override
  State<MyPick> createState() => _MyPickState();
}

class _MyPickState extends State<MyPick> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    List<Item> items = await Api().getLikeImte();
    print(items);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('마이 픽'),
      ),
    );
  }
}
