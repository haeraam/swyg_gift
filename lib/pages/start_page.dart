import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swyg/cubits/banner_item_cubit.dart/banner_item_cubit.dart';
import 'package:swyg/cubits/item_list_cubit/item_list_cubit.dart';
import 'package:swyg/pages/create_item_page/create_item_image.dart';
import 'package:swyg/pages/create_item_page/create_item_keyword.dart';
import 'package:swyg/pages/create_item_page/create_item_name.dart';
import 'package:swyg/pages/create_item_page/create_item_price.dart';
import 'package:swyg/pages/create_list_page/create_list.dart';
import 'package:swyg/pages/home_page/home_page.dart';
import 'package:swyg/pages/my_page/my_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemListCubit(initialList: []),
        ),
        BlocProvider(
          create: (context) => BannerItemCubit(),
        ),
        BlocProvider(
          create: (context) => BannerItemCubit(),
        ),
        BlocProvider(
          create: (context) => BannerItemCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData(fontFamily: 'Pretendard'),
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
        child: CreateItemImage(),
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
        child: CreateItemName(),
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
  ],
);
