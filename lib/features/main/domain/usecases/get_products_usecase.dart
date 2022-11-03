import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/core/usecases/usecase.dart';
import 'package:farfor_demo/features/main/data/models/category_model.dart';
import 'package:farfor_demo/features/main/domain/repositories/products_repository.dart';

class GetProductsUseCase extends UseCase<List<CategoryModel>, NoParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase(this.productsRepository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParams params) async {
    final response = await productsRepository.getProducts();
    return response;
  }
}
