import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';

abstract class CartRepository {
  /// Get all saved products
  Future<Either<Failure, List<ProductModel>>> getSavedProducts();

  /// add product
  Future<Either<Failure, bool>> addSavedProduct(ProductModel product);

  /// remove product
  Future<Either<Failure, bool>> removeSavedProducts();
}
