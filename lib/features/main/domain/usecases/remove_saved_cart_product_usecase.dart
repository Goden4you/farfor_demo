import 'package:dartz/dartz.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/core/usecases/usecase.dart';
import 'package:farfor_demo/features/main/domain/repositories/cart_repository.dart';

class RemoveSavedCartProductsUseCase extends UseCase<bool, NoParams> {
  final CartRepository cartRepository;

  RemoveSavedCartProductsUseCase(this.cartRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final response = await cartRepository.removeSavedProducts();
    return response;
  }
}
