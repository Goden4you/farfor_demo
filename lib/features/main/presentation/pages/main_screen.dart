import 'dart:async';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/strings.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:farfor_demo/features/main/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:farfor_demo/features/main/presentation/pages/cart_page.dart';
import 'package:farfor_demo/features/main/presentation/widgets/tab_navigator.dart';
import 'package:farfor_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_links/uni_links.dart' as ul;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  String _categoryPage = CategoriesTabNavigatorRoutes.root;

  final _navigatorKey = GlobalKey<NavigatorState>();

  final GlobalKey<CartIconKey> _cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  late final StreamSubscription _sub;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductsBloc>(context).add(GetCategoriesAndProductsEvent());
    BlocProvider.of<CartBloc>(context).add(GetSavedCartProductsEvent(
        cartKey: _cartKey,
        function: (key, cartKey) async {
          await runAddToCardAnimation(key);
          await cartKey.currentState?.runCartAnimation();
        }));
  }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
        gkCart: _cartKey,
        rotation: false,
        dragToCardCurve: Curves.easeIn,
        dragToCardDuration: const Duration(milliseconds: 500),
        previewCurve: Curves.linearToEaseOut,
        previewDuration: Duration.zero,
        previewHeight: 30,
        previewWidth: 30,
        opacity: 0.85,
        initiaJump: false,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Scaffold(
          appBar: null,
          body: _getCurrentBody(),
          bottomNavigationBar: BottomNavigationBar(
            items: _getBottomNavigationItems(),
            elevation: 4,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.black,
            unselectedItemColor: AppColors.grey,
            selectedLabelStyle: AppTextStyles.medium12pt,
            unselectedLabelStyle:
                AppTextStyles.medium12pt.copyWith(color: AppColors.grey),
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                if (index == 0 &&
                    _index == 0 &&
                    _categoryPage != CategoriesTabNavigatorRoutes.root) {
                  _navigatorKey.currentState?.pop();
                  _categoryPage = CategoriesTabNavigatorRoutes.root;
                }

                _index = index;
              });
            },
          ),
        ));
  }

  List<BottomNavigationBarItem> _getBottomNavigationItems() {
    return [
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          AssetsIcons.menu,
          color: AppColors.black,
        ),
        icon: SvgPicture.asset(AssetsIcons.menu, color: AppColors.grey),
        label: S.of(context).menu,
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          AssetsIcons.basket,
          color: AppColors.black,
        ),
        icon: SvgPicture.asset(
          AssetsIcons.basket,
          key: _cartKey,
          color: AppColors.grey,
        ),
        label: S.of(context).cart,
      ),
    ];
  }

  Widget _getCurrentBody() {
    switch (_index) {
      case 0:
        return CategoriesTabNavigator(
          navigatorKey: _navigatorKey,
          initialRoute: _categoryPage,
          onChanged: (route) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _categoryPage = route;
              });
            });
          },
        );
      default:
        return const CartPage();
    }
  }

  Future checkDeepLink() async {
    try {
      final initialUri = await ul
          .getInitialLink(); // Тут мы получаем ссылку, с которой приложение стартануло.
      // А дальше делаем, что хотим с ней
    } catch (_) {}
  }

  Future setDeepLinkStream() async {
    try {
      _sub = ul.linkStream.listen((String? uri) {
        // Смотрим, с какой ссылки в приложение вернулись (не запустили с нуля)
        // И делаем что хотим
      }, onError: (err) {});
    } catch (_) {}
  }
}
