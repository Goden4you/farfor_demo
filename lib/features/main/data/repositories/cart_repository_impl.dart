import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/exceptions.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/core/platform/network_info.dart';
import 'package:farfor_demo/features/main/data/datasources/cart_local_datasource.dart';
import 'package:farfor_demo/features/main/data/models/hive/product_hive_model.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getSavedProducts() async {
    try {
      final list = await localDataSource.getSavedProducts();

      final _normalModels = list.map((e) => ProductModel.fromHive(e)).toList();

      return Right(_normalModels);
    } on CacheException catch (exception) {
      throw Left(
        GeneralFailure(
          exception.detail,
          null,
        ),
      );
    } on UnknownException catch (exception) {
      return Left(
        GeneralFailure(
          exception.detail,
          null,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addSavedProduct(ProductModel product) async {
    try {
      final result = await localDataSource.addSavedProduct(
          ProductHiveModel.fromModel(product, count: product.count));

      return Right(result);
    } on CacheException catch (exception) {
      throw Left(
        GeneralFailure(
          exception.detail,
          null,
        ),
      );
    } on UnknownException catch (exception) {
      return Left(
        GeneralFailure(
          exception.detail,
          null,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> removeSavedProducts() async {
    try {
      final result = await localDataSource.removeSavedProducts();

      return Right(result);
    } on CacheException catch (exception) {
      throw Left(
        GeneralFailure(
          exception.detail,
          null,
        ),
      );
    } on UnknownException catch (exception) {
      return Left(
        GeneralFailure(
          exception.detail,
          null,
        ),
      );
    }
  }
}
