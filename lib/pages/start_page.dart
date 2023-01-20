import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swyg/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:swyg/cubits/banner_item_cubit.dart/banner_item_cubit.dart';
import 'package:swyg/cubits/best_category_cubit/best_category_cubit.dart';
import 'package:swyg/cubits/best_member_cubit/best_member_cubit.dart';
import 'package:swyg/cubits/create_item_cubit/create_item_cubit.dart';
import 'package:swyg/cubits/hot_keyword_item_list_cubit/hot_keyword_item_list_cubit.dart';
import 'package:swyg/cubits/item_detail_cubit/item_detail_cubit.dart';
import 'package:swyg/cubits/list_detail_cubit/list_detail_cubit.dart';
import 'package:swyg/cubits/new_item_cubit/new_item_cubit.dart';
import 'package:swyg/cubits/weekly_bset_item_cubit/weekly_bset_item_cubit.dart';
import 'package:swyg/pages/create_item_page/create_item_image.dart';
import 'package:swyg/pages/create_item_page/create_item_keyword.dart';
import 'package:swyg/pages/create_item_page/create_item_name.dart';
import 'package:swyg/pages/create_item_page/create_item_price.dart';
import 'package:swyg/pages/create_list_page/create_list.dart';
import 'package:swyg/pages/home_page/home_page.dart';
import 'package:swyg/pages/item_page/item_detail_page.dart';
import 'package:swyg/pages/list_page/list_detail_page.dart';
import 'package:swyg/pages/my_page/my_page.dart';
import 'package:swyg/pages/signIn/sign_in.dart';
import 'package:swyg/utils/api.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BannerItemCubit()),
        BlocProvider(create: (context) => NewItemCubit()),
        BlocProvider(create: (context) => BestCategoryCubit()),
        BlocProvider(create: (context) => AllCategoryCubit()),
        BlocProvider(create: (context) => BestMemberCubit()),
        BlocProvider(create: (context) => WeeklyBsetItemCubit()),
        BlocProvider(create: (context) => CreateItemCubit()),
        BlocProvider(create: (context) => HotKeywordItemListCubit()),
        BlocProvider(create: (context) => ItemDetailCubit()),
        BlocProvider(create: (context) => ListDetailCubit()),
      ],
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          theme: ThemeData(fontFamily: 'Pretendard'),
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: animation.drive(
              Tween(
                begin: state.extra == 'back' ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(
                CurveTween(curve: Curves.ease),
              ),
            ),
            child: child),
      ),
      // builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/mypage',
      builder: (context, state) => const MyPage(),
    ),
    GoRoute(
      path: '/createItemKeyWord',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: CreateItemKeyWord(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: animation.drive(
              Tween(
                begin: state.extra == 'back' ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(
                CurveTween(curve: Curves.ease),
              ),
            ),
            child: child),
      ),
    ),
    GoRoute(
      path: '/createItemImage',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const CreateItemImage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: animation.drive(
              Tween(
                begin: state.extra == 'back' ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(
                CurveTween(curve: Curves.ease),
              ),
            ),
            child: child),
      ),
    ),
    GoRoute(
      path: '/createItemName',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const CreateItemName(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: animation.drive(
              Tween(
                begin: state.extra == 'back' ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(
                CurveTween(curve: Curves.ease),
              ),
            ),
            child: child),
      ),
    ),
    GoRoute(
      path: '/createItemPrice',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: CreateItemPrice(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: animation.drive(
              Tween(
                begin: state.extra == 'back' ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(
                CurveTween(curve: Curves.ease),
              ),
            ),
            child: child),
      ),
    ),
    GoRoute(
      path: '/createList',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const CreateListPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/item/:itemId',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: ItemDetailPage(itemId: state.params['itemId'] ?? '0'),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/itemlist/:listId',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: ListDetailPage(listId: state.params['listId'] ?? '0'),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/singIn',
      redirect: (context, state) async {
        var res = await Api().getUser(id: state.queryParams['memberId'] ?? '');
        Hive.box('auth').put('memberNm', res[0]['memberNm']);
        Hive.box('auth').put('memberEmail', res[0]['memberEmail']);
        Hive.box('auth').put('memberId', res[0]['memberId']);
        return '/';
      },
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SignIn(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
  ],
);
