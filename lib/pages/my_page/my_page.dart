import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/pages/page.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_left),
        ),
      ),
      body: PageWrap(
        child: Container(
          child: Center(
            child: Text('마이 페이지'),
          ),
        ),
      ),
    );
  }
}
