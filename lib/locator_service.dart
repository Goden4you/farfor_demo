import 'package:farfor_demo/core/network/farfor_client.dart';
import 'package:farfor_demo/core/platform/network_info.dart';
import 'package:farfor_demo/features/main/data/datasources/cart_local_datasource.dart';
import 'package:farfor_demo/features/main/data/datasources/products_remote_datasource.dart';
import 'package:farfor_demo/features/main/data/repositories/cart_repository_impl.dart';
import 'package:farfor_demo/features/main/data/repositories/products_repository_impl.dart';
import 'package:farfor_demo/features/main/domain/repositories/cart_repository.dart';
import 'package:farfor_demo/features/main/domain/repositories/products_repository.dart';
import 'package:farfor_demo/features/main/domain/usecases/get_products_usecase.dart';
import 'package:farfor_demo/features/main/domain/usecases/get_saved_cart_products_usecase.dart';
import 'package:farfor_demo/features/main/domain/usecases/add_saved_cart_product_usecase.dart';
import 'package:farfor_demo/features/main/domain/usecases/remove_saved_cart_product_usecase.dart';
import 'package:farfor_demo/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:farfor_demo/features/main/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:farfor_demo/features/main/presentation/bloc/remote_config_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ------------- Main part ------------- \\

  // --- Bloc --- \\
  sl.registerFactory(
    () => ProductsBloc(
      getProductsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CartBloc(
      getSavedCartProductsUseCase: sl(),
      addSavedCartProductsUseCase: sl(),
      removeSavedCartProductsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => RemoteConfigCubit(),
  );
  // ---------------- \\

  // --- UseCases --- \\
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetSavedCartProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddSavedCartProductsUseCase(sl()));
  sl.registerLazySingleton(() => RemoveSavedCartProductsUseCase(sl()));
  // ------------------- \\

  // --- Repositories --- \\
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // ------------------ \\

  // --- Datasources --- \\
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(client: FarforClient().getDio()),
  );
  sl.registerLazySingleton<CartLocalDataSource>(
    () => const CartLocalDataSourceImpl(),
  );
  // ------------------ \\

  // --- External --- \\
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );
  // ----------------------------------------------------------- \\
}
