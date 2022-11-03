import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/core/usecases/usecase.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/domain/repositories/cart_repository.dart';

class GetSavedCartProductsUseCase
    extends UseCase<List<ProductModel>, NoParams> {
  final CartRepository basketRepository;

  GetSavedCartProductsUseCase(this.basketRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    final response = await basketRepository.getSavedProducts();
    return response;
  }
}
