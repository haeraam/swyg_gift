import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/constant/constant.dart';
import 'package:swyg/cubits/cubit/item_list_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/category_page/category_page.dart';
import 'package:swyg/pages/home_page/components/custom_action_button.dart';
import 'package:swyg/pages/home_page/components/home_carousel_slider.dart';
import 'package:swyg/pages/home_page/components/home_go_to_category_banner.dart';
import 'package:swyg/pages/my_page/my_page.dart';
import 'package:swyg/pages/my_pick_page/my_pick.dart';
import 'package:swyg/theme/color.dart';
import 'package:swyg/widgets/item_widget.dart';

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
      const CategoryPage(),
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
      floatingActionButton: const CustomActionButton(),
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
    return BlocListener<ItemListCubit, ItemListState>(
      listener: (context, state) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeCarouselSlider(),
          const HomeGoToCategoryBanner(),
          const Text(
            'qweqwe',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 150,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    ItemWidget(name: items[index].productNm, isFocused: index == 0),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'asdasd',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 150,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    ItemWidget(name: 'data$index'),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
