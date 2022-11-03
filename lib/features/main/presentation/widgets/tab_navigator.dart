import 'package:farfor_demo/core/constants/strings.dart';
import 'package:farfor_demo/features/main/presentation/pages/categories_page.dart';
import 'package:farfor_demo/features/main/presentation/pages/products_page.dart';
import 'package:flutter/cupertino.dart';

class CategoriesTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;
  final Function(String) onChanged;
  const CategoriesTabNavigator(
      {Key? key,
      required this.navigatorKey,
      required this.initialRoute,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (routeSettings) {
        return CupertinoPageRoute<bool>(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      CategoriesTabNavigatorRoutes.root: (context) => CategoriesPage(
            onPush: () => _push(context),
          ),
      CategoriesTabNavigatorRoutes.detail: (context) => ProductsPage(onPop: () {
            onChanged(CategoriesTabNavigatorRoutes.root);
          }),
    };
  }

  void _push(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    onChanged(CategoriesTabNavigatorRoutes.detail);

    Navigator.of(context).push(
      CupertinoPageRoute<bool>(
        builder: (context) =>
            routeBuilders[CategoriesTabNavigatorRoutes.detail]!(context),
      ),
    );
  }
}
