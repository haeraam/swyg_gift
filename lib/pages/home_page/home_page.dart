import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swyg/constant/constant.dart';
import 'package:swyg/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:swyg/cubits/banner_item_cubit.dart/banner_item_cubit.dart';
import 'package:swyg/cubits/best_category_cubit/best_category_cubit.dart';
import 'package:swyg/cubits/create_item_cubit/create_item_cubit.dart';
import 'package:swyg/cubits/home_menu_cubit/home_menu_cubit.dart';
import 'package:swyg/cubits/my_pick_cubit/my_pick_cubit.dart';
import 'package:swyg/cubits/new_item_cubit/new_item_cubit.dart';
import 'package:swyg/cubits/weekly_bset_item_cubit/weekly_bset_item_cubit.dart';
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
import 'package:swyg/utils/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pageList = [];

  @override
  void initState() {
    context.read<AllCategoryCubit>().getCategorys();
    context.read<BannerItemCubit>().getItems();
    context.read<NewItemCubit>().getItems();
    context.read<BestCategoryCubit>().getCategorys();
    context.read<WeeklyBsetItemCubit>().getItems();
    context.read<MyPickCubit>().getLikes();
    Api().apiTest();

    _pageList = [
      const HomeContent(),
      // const CategoryPage(),
      const MyPick(),
      const MyPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pageIndex = context.watch<HomeMenuCubit>().state.pageIndex;

    return Scaffold(
      drawerEdgeDragWidth: 200,
      backgroundColor: pageIndex != 0 ? const Color(0xFFF4F4F4) : Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 420),
          child: PageView(
            controller: homePageController,
            children: _pageList,
            onPageChanged: (index) {
              context.read<HomeMenuCubit>().setIndex(index: index);
            },
          ),
        ),
      ),
      floatingActionButton: pageIndex == 0 ? const CustomActionButton() : null,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_home.png', width: 32),
            label: '홈',
          ),
          // BottomNavigationBarItem(
          //   icon: Image.asset('assets/images/nav_icon_category.png', width: 32),
          //   label: '카테고리',
          // ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_favorit.png', width: 32),
            label: 'My pick',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/nav_icon_my_page.png', width: 32),
            label: '내정보',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(index) {
    context.read<HomeMenuCubit>().setIndex(index: index);
    homePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeIn,
    );
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
      // const SizedBox(height: 50),
      // Container(height: 1, width: double.infinity, color: blackB5C),
      // const SizedBox(height: 28),
      // const HomeMemberRankArea(),
      const SizedBox(height: 50),
      Container(height: 1, width: double.infinity, color: blackB5C),
      const SizedBox(height: 28),
      const HomeNewItemArea(),
      const SizedBox(height: 50),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        color: const Color(0xFFEEEEEE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MY PICK',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: blackB3C),
            ),
            const SizedBox(height: 8),
            Row(children: const [
              Text(
                '개인정보처리방침',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackB3C),
              ),
              SizedBox(width: 4),
              Text(
                '|',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackB3C),
              ),
              SizedBox(width: 4),
              Text(
                '개인정보처리방침',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackB3C),
              ),
              SizedBox(width: 4),
              Text(
                '|',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackB3C),
              ),
              SizedBox(width: 4),
              Text(
                '개인정보처리방침',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackB3C),
              ),
            ]),
            const SizedBox(height: 16),
            const Text(
              'Powered by HY, Zion Lee, Sharkpia Copyright © SWYG. All rights reserved.',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      )
    ];
    return MultiBlocListener(
      listeners: [
        BlocListener<CreateItemCubit, CreateItemState>(
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
