import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/cubit/item_list_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/pages/category_page/category_page.dart';
import 'package:swyg/pages/home_page/components/custom_action_button.dart';
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
  final PageController _pageController = PageController();

  final List<Widget> _pageList = [
    HomeContent(),
    const CategoryPage(),
    const MyPick(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
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
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
    });
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({super.key});

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

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  CarouselController carouselController = CarouselController();
  int curruntCarouslIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262,
      color: blackB1C,
      child: Column(
        children: [
          const SizedBox(height: 59),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My pick',
                  style: TextStyle(fontSize: 17, color: primaryC, fontWeight: FontWeight.w900),
                ),
                Text(
                  '$curruntCarouslIndex / 5',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          CarouselSlider(
            items: const [
              HomeCrouselCard(
                title: 'pick1',
                coment: '노스 페이스 눕시\n이번 겨울은 노스페이스와!',
                imgUrl: 'https://image.msscdn.net/images/goods_img/20220412/2482269/2482269_1_320.jpg',
              ),
              HomeCrouselCard(
                title: 'pick2',
                coment: '신혼집 필수템\n인테리어의 시작과 끝!',
                imgUrl: 'https://image.msscdn.net/images/goods_img/20220727/2684105/2684105_2_320.jpg',
              ),
              HomeCrouselCard(
                title: 'pick3',
                coment: '명품도 귀엽게!\n미우미우 페니 로퍼',
                imgUrl: 'https://image.msscdn.net/images/goods_img/20220729/2688346/2688346_1_320.jpg',
              ),
              HomeCrouselCard(
                title: 'pick4',
                coment: '겨울 패션의 마침표.\n기본 니트머플러',
                imgUrl: 'https://image.msscdn.net/images/goods_img/20210906/2110699/2110699_7_320.jpg',
              ),
              HomeCrouselCard(
                title: 'pick5',
                coment: '대세는 살로몬 꾸안꾸 스타일의 완성',
                imgUrl: 'https://image.msscdn.net/images/goods_img/20221123/2958053/2958053_1_320.jpg',
              ),
            ],
            carouselController: carouselController,
            options: CarouselOptions(
              // autoPlay: true,
              height: 122,
              viewportFraction: 1,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => setState(() => curruntCarouslIndex = index + 1),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCrouselCard extends StatelessWidget {
  const HomeCrouselCard({super.key, required this.title, required this.coment, required this.imgUrl});
  final String title;
  final String coment;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(color: primaryC, borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: blackB1C,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  coment,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 40),
          SizedBox(
            width: 112,
            height: 112,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
            ),
          ),
        ],
      ),
    );
  }
}
