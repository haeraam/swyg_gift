import 'dart:math';

import 'package:swyg/models/item_model.dart';

getTestItemList(int length) => List.generate(
    length,
    (index) => Item(
          productId: '$index',
          productNm: '테스트아이템$index',
          productCm: '테스트아이템입니다.',
          productPrice: 1000 * index,
          productUrl: 'www.naver.com',
          productImg: '',
          categoryNm: ['카테고리1', '카테고리2', '카테고리3'],
          productCnt: Random().nextInt(80) + 20,
          productWcnt: Random().nextInt(10),
          memberName: '등록한사람$index',
          productCreateDt: DateTime.now(),
          productUpdateDt: DateTime.now(),
          productBestcmt: '최고의 상품을 소개합니다!$index',
        ));

getTestItem() {
  int index = 1;
  return Item(
    productId: '$index',
    productNm: '테스트아이템$index',
    productCm: '테스트아이템입니다.',
    productPrice: 1000 * index,
    productUrl: 'www.naver.com',
    productImg: '',
    categoryNm: ['카테고리1', '카테고리2', '카테고리3'],
    productCnt: Random().nextInt(80) + 20,
    productWcnt: Random().nextInt(10),
    memberName: '등록한사람$index',
    productCreateDt: DateTime.now(),
    productUpdateDt: DateTime.now(),
    productBestcmt: '최고의 상품을 소개합니다!$index',
  );
}
