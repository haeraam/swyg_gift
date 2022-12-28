import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:swyg/cubits/banner_item_cubit.dart/banner_item_cubit.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/theme/color.dart';

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
    List<Item> items = context.watch<BannerItemCubit>().state.itemList;

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: 1,
      (context, index) => Container(
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
                    'MY PICK',
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
              items: items
                  .map((item) => HomeCrouselCard(
                        title: item.productNm,
                        coment: item.productBestCmt ?? '',
                        imgUrl: item.productImg,
                      ))
                  .toList(),
              // items: const [
              //   HomeCrouselCard(
              //     title: 'PICK1',
              //     coment: '노스 페이스 눕시\n이번 겨울은 노스페이스와!',
              //     imgUrl: 'https://image.msscdn.net/images/goods_img/20220412/2482269/2482269_1_320.jpg',
              //   ),
              //   HomeCrouselCard(
              //     title: 'PICK2',
              //     coment: '신혼집 필수템\n인테리어의 시작과 끝!',
              //     imgUrl: 'https://image.msscdn.net/images/goods_img/20220727/2684105/2684105_2_320.jpg',
              //   ),
              //   HomeCrouselCard(
              //     title: 'PICK3',
              //     coment: '명품도 귀엽게!\n미우미우 페니 로퍼',
              //     imgUrl: 'https://image.msscdn.net/images/goods_img/20220729/2688346/2688346_1_320.jpg',
              //   ),
              //   HomeCrouselCard(
              //     title: 'PICK4',
              //     coment: '겨울 패션의 마침표.\n기본 니트머플러',
              //     imgUrl: 'https://image.msscdn.net/images/goods_img/20210906/2110699/2110699_7_320.jpg',
              //   ),
              //   HomeCrouselCard(
              //     title: 'PICK5',
              //     coment: '대세는 살로몬 꾸안꾸 스타일의 완성',
              //     imgUrl: 'https://image.msscdn.net/images/goods_img/20221123/2958053/2958053_1_320.jpg',
              //   ),
              // ],
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: true,
                height: 122,
                viewportFraction: 1,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) => setState(() => curruntCarouslIndex = index + 1),
              ),
            ),
          ],
        ),
      ),
    ));
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
              backgroundImage: ImageNetwork(image: imgUrl, height: 112, width: 112).imageCache,
            ),
          ),
        ],
      ),
    );
  }
}
