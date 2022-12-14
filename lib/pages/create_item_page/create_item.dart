import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/pages/page.dart';

class CreateItemPage extends StatelessWidget {
  const CreateItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_left),
        ),
      ),
      body: const PageWrap(
        child: Center(
          child: Text('아이템 생성'),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // context.read<ItemListCubit>().addItems(
        //     );
        context.go('/');
      }),
    );
  }
}
