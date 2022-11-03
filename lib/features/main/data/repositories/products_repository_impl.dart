import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/exceptions.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/core/platform/network_info.dart';
import 'package:farfor_demo/features/main/data/datasources/products_remote_datasource.dart';
import 'package:farfor_demo/features/main/data/models/category_model.dart';
import 'package:farfor_demo/features/main/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryModel>>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final list = await remoteDataSource.getProducts();
        return Right(list);
      } on ServerException catch (exception) {
        return Left(
          GeneralFailure(
            exception.status >= 500 ? exception.title : exception.detail,
            exception.type,
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
    return Left(NoInternetConnectionFailure());
  }
}
