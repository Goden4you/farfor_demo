import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/features/main/data/models/category_model.dart';

abstract class ProductsRepository {
  /// Get all information about categories and products
  Future<Either<Failure, List<CategoryModel>>> getProducts();
}
