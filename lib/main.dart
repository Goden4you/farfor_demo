import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/utils/navigation_service.dart';
import 'package:farfor_demo/features/main/data/models/hive/product_hive_model.dart';
import 'package:farfor_demo/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:farfor_demo/features/main/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:farfor_demo/features/main/presentation/bloc/remote_config_cubit.dart';
import 'package:farfor_demo/features/main/presentation/pages/categories_page.dart';
import 'package:farfor_demo/features/main/presentation/pages/main_screen.dart';
import 'package:farfor_demo/features/main/presentation/pages/products_page.dart';
import 'package:farfor_demo/firebase_options.dart';
import 'package:farfor_demo/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:farfor_demo/locator_service.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  await Hive.initFlutter()
      .then((_) => Hive.registerAdapter(ProductHiveModelAdapter()));

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.fetchAndActivate();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bank Account Adding
        BlocProvider<ProductsBloc>(create: (context) => di.sl<ProductsBloc>()),
        BlocProvider<CartBloc>(create: (context) => di.sl<CartBloc>()),
        BlocProvider<RemoteConfigCubit>(
            create: (context) => di.sl<RemoteConfigCubit>()),
      ],

      // App
      child: MaterialApp(
        title: 'N + 1',
        debugShowCheckedModeBanner: false,

        // Theme
        theme: ThemeData.light().copyWith(
          backgroundColor: AppColors.white,
          scaffoldBackgroundColor: AppColors.white,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
        ),

        // Localization
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),

        // Routes
        home: const MainScreen(),
        navigatorKey: NavigationService.navigatorKey,
        routes: {
          CategoriesPage.routeName: (ctx) => CategoriesPage(),
          ProductsPage.routeName: (ctx) => const ProductsPage(),
        },
      ),
    );
  }
}
