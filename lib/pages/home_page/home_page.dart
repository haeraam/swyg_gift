import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/constant/constant.dart';
import 'package:swyg/cubits/cubit/item_list_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/category_page/category_page.dart';
import 'package:swyg/pages/home_page/components/custom_action_button.dart';
import 'package:swyg/pages/home_page/components/home_carousel_slider.dart';
import 'package:swyg/pages/home_page/components/home_go_to_category_banner.dart';
import 'package:swyg/pages/home_page/components/home_hot_keyword_area.dart';
import 'package:swyg/pages/home_page/components/home_member_rank_area.dart';
import 'package:swyg/pages/home_page/components/home_weekly_rank_area.dart';
import 'package:swyg/pages/my_page/my_page.dart';
import 'package:swyg/pages/my_pick_page/my_pick.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_list_widget.dart';
import 'package:swyg/widgets/item_rank_widget.dart';
import 'package:swyg/widgets/member_rank_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _pageList = [];

  @override
  void initState() {
    _pageList = [
      const HomeContent(),
      CategoryPage(),
      const MyPick(),
      const MyPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: homePageController,
        children: _pageList,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      floatingActionButton: _selectedIndex == 0 ? const CustomActionButton() : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'My pick',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '내정보',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryC,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
      homePageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeIn,
      );
    });
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<ItemListCubit>().state.itemList;
    List<Widget> homeSliverList = [
      const HomeHotKeywordArea(),
      const SizedBox(height: 50),
      Container(height: 1, width: double.infinity, color: blackB5C),
      const SizedBox(height: 28),
      const HomeWeeklyItemRankArea(),
      const SizedBox(height: 50),
      Container(height: 1, width: double.infinity, color: blackB5C),
      const SizedBox(height: 28),
      const HomeMemberRankArea(),
      const SizedBox(height: 50),
      Container(height: 1, width: double.infinity, color: blackB5C),
      const SizedBox(height: 28),
      const HomeNewItemArea()
    ];
    return BlocListener<ItemListCubit, ItemListState>(
      listener: (context, state) {},
      child: CustomScrollView(
        slivers: [
          const HomeCarouselSlider(),
          const HomeGoToCategoryBanner(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: homeSliverList.length,
              (context, index) => homeSliverList[index],
            ),
          )
        ],
      ),
    );
  }
}

class HomeNewItemArea extends StatelessWidget {
  const HomeNewItemArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NEW 선물 아이템',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 212,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Row(
                  children: [
                    ItemListWidget(
                      item: Item(
                          productId: 'productId',
                          productNm: '리스트명',
                          productCm: 'productCm',
                          productPrice: 0,
                          productUrl: 'productUrl',
                          productImg: 'productImg',
                          categoryNm: [],
                          productCnt: Random().nextInt(100),
                          productWcnt: 0,
                          memberName: '제작자',
                          productCreateDt: DateTime.now(),
                          productUpdateDt: DateTime.now(),
                          productBestcmt: 'productBestcmt'),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
