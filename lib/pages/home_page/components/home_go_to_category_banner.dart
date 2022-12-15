import 'package:flutter/material.dart';
import 'package:swyg/constant/constant.dart';
import 'package:swyg/theme/color.dart';

class HomeGoToCategoryBanner extends StatelessWidget {
  const HomeGoToCategoryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 40),
      sliver: SliverAppBar(
        pinned: true,
        elevation: 0,
        toolbarHeight: 0,
        titleSpacing: 0,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsetsDirectional.zero,
          centerTitle: false,
          title: GestureDetector(
            onTap: () {
              homePageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
            child: Container(
              height: 48,
              color: background2C,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '어떤 선물을 찾으세요?',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
