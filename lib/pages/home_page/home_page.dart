import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/constant/constant.dart';
import 'package:swyg/cubits/banner_item_cubit.dart/banner_item_cubit.dart';
import 'package:swyg/cubits/item_list_cubit/item_list_cubit.dart';
import 'package:swyg/pages/category_page/category_page.dart';
import 'package:swyg/pages/home_page/components/custom_action_button.dart';
import 'package:swyg/pages/home_page/components/home_carousel_slider.dart';
import 'package:swyg/pages/home_page/components/home_go_to_category_banner.dart';
import 'package:swyg/pages/home_page/components/home_hot_keyword_area.dart';
import 'package:swyg/pages/home_page/components/home_member_rank_area.dart';
import 'package:swyg/pages/home_page/components/home_new_item_area.dart';
import 'package:swyg/pages/home_page/components/home_weekly_rank_area.dart';
import 'package:swyg/pages/my_page/my_page.dart';
import 'package:swyg/pages/my_pick_page/my_pick.dart';
import 'package:swyg/theme/color.dart';

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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_home.png', width: 32),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_category.png', width: 32),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_favorit.png', width: 32),
            label: 'My pick',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_my_page.png', width: 32),
            label: '내정보',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
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
  void initState() {
    context.read<BannerItemCubit>().getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    return MultiBlocListener(
      listeners: [
        BlocListener<ItemListCubit, ItemListState>(
          listener: (context, state) {
            print(state);
          },
        ),
        BlocListener<BannerItemCubit, BannerItemState>(
          listener: (context, state) {},
        ),
      ],
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
