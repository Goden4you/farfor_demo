import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:farfor_demo/core/domain/failure.dart';
import 'package:farfor_demo/core/usecases/usecase.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/domain/repositories/cart_repository.dart';

class AddSavedCartProductsUseCase
    extends UseCase<bool, AddSavedCartProductsParams> {
  final CartRepository basketRepository;

  AddSavedCartProductsUseCase(this.basketRepository);

  @override
  Future<Either<Failure, bool>> call(AddSavedCartProductsParams params) async {
    final response = await basketRepository.addSavedProduct(params.product);
    return response;
  }
}

class AddSavedCartProductsParams extends Equatable {
  final ProductModel product;

  const AddSavedCartProductsParams({required this.product});

  @override
  List<Object?> get props => [product];
}
