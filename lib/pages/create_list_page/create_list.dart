import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/pages/page.dart';

class CreateListPage extends StatelessWidget {
  const CreateListPage({Key? key}) : super(key: key);

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
        child: Center(
          child: Text('리스트 생성'),
        ),
      ),
    );
  }
}
