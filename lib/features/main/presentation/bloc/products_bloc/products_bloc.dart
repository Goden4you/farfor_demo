import 'package:equatable/equatable.dart';
import 'package:farfor_demo/core/constants/enums.dart';
import 'package:farfor_demo/core/constants/strings.dart';
import 'package:farfor_demo/core/usecases/usecase.dart';
import 'package:farfor_demo/features/main/data/models/category_model.dart';
import 'package:farfor_demo/features/main/domain/usecases/get_products_usecase.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';
part 'products_event.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  /// **[NoParams]** required
  final GetProductsUseCase getProductsUseCase;

  ProductsBloc({
    required this.getProductsUseCase,
  }) : super(const ProductsState.initial()) {
    on<GetCategoriesAndProductsEvent>((event, emit) async {
      emit(state.copyWith(status: StateStatus.loading));

      final failureOrList = await getProductsUseCase(NoParams());

      failureOrList.fold(
          (failure) => emit(state.copyWith(
              status: StateStatus.failure,
              errorMessage: failure.message)), (list) {
        final _unavailableId = int.tryParse(FirebaseRemoteConfig.instance
            .getString(Features.invisibleCategoryId));

        emit(state.copyWith(
          status: StateStatus.success,
          allCategories:
              list.where((element) => element.id != _unavailableId).toList(),
        ));
      });
    });
    on<SetCurrentCategoryEvent>((event, emit) async {
      emit(state.copyWith(currentCategory: event.category));
    });
  }
}
