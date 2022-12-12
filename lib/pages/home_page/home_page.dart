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
      appBar: AppBar(
        title: const Text(
          'My pick',
          style: TextStyle(fontSize: 17, color: Color(0xFFFF630B), fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF212121),
        elevation: 0,
      ),
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
        selectedItemColor: Colors.amber[800],
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

class HomeContent extends StatelessWidget {
  HomeContent({super.key});
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<ItemListCubit>().state.itemList;
    return BlocListener<ItemListCubit, ItemListState>(
        listener: (context, state) {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [
                  Container(
                    color: Color(0xFF212121),
                    child: Center(
                      child: Text('테스트1',
                          style: TextStyle(
                              fontSize: 30, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w900)),
                    ),
                  ),
                  Container(
                    color: Color(0xFF212121),
                    child: Center(
                      child: Text('테스트2',
                          style: TextStyle(
                              fontSize: 30, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w900)),
                    ),
                  ),
                  Container(
                    color: Color(0xFF212121),
                    child: Center(
                      child: Text('테스트3',
                          style: TextStyle(
                              fontSize: 30, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w900)),
                    ),
                  ),
                ],
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: 120,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                ),
              ),
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
                        ItemWidget(name: 'data$index', isFocused: index == 0),
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
        ));
  }
}
