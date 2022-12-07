import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageWrap extends StatelessWidget {
  const PageWrap({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // context.go('/');
        return false;
      },
      child: child,
    );
  }
}
