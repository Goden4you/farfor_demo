import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:equatable/equatable.dart';
import 'package:farfor_demo/core/constants/enums.dart';
import 'package:farfor_demo/core/usecases/usecase.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/domain/usecases/get_saved_cart_products_usecase.dart';
import 'package:farfor_demo/features/main/domain/usecases/add_saved_cart_product_usecase.dart';
import 'package:farfor_demo/features/main/domain/usecases/remove_saved_cart_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';
part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  /// **[NoParams]** required
  final GetSavedCartProductsUseCase getSavedCartProductsUseCase;

  /// **[AddSavedCartProductsParams]** required
  final AddSavedCartProductsUseCase addSavedCartProductsUseCase;

  /// **[RemoveSavedCartProductsParams]** required
  final RemoveSavedCartProductsUseCase removeSavedCartProductsUseCase;

  CartBloc({
    required this.getSavedCartProductsUseCase,
    required this.addSavedCartProductsUseCase,
    required this.removeSavedCartProductsUseCase,
  }) : super(const CartState.initial()) {
    on<AddProductToCartEvent>((event, emit) async {
      if (state.cartKey != null) {
        state.addToCartFunction?.call(event.key, state.cartKey!);
      }

      List<ProductModel> _newList = state.allProducts.toList();

      ProductModel _product = event.product;

      if (_newList.any((element) => element.id == event.product.id)) {
        _newList = state.allProducts.map((e) {
          if (e.id == event.product.id) {
            _product = e.increaseCount();
            return _product;
          }

          return e;
        }).toList();
      } else {
        _newList.add(_product);
      }

      emit(state.copyWith(allProducts: _newList));

      final failureOrSaved = await addSavedCartProductsUseCase(
          AddSavedCartProductsParams(product: _product));

      failureOrSaved.fold(
        (l) => emit(
          state.copyWith(status: StateStatus.failure, errorMessage: l.message),
        ),
        (r) => emit(
          state.copyWith(status: StateStatus.success),
        ),
      );
    });
    on<RemoveAllProductcFromCartEvent>((event, emit) async {
      final _products = state.allProducts;

      emit(state.copyWith(allProducts: []));

      final failureOrSaved = await removeSavedCartProductsUseCase(NoParams());

      failureOrSaved.fold(
        (l) => emit(
          state.copyWith(
              status: StateStatus.failure,
              errorMessage: l.message,
              allProducts: _products),
        ),
        (r) => emit(
          state.copyWith(status: StateStatus.success),
        ),
      );
    });
    on<GetSavedCartProductsEvent>((event, emit) async {
      emit(state.copyWith(
          status: StateStatus.loading,
          cartKey: event.cartKey,
          addToCartFunction: event.function));

      final failureOrList = await getSavedCartProductsUseCase(NoParams());

      failureOrList.fold(
          (failure) => emit(state.copyWith(
              status: StateStatus.failure, errorMessage: failure.message)),
          (list) => emit(
              state.copyWith(status: StateStatus.success, allProducts: list)));
    });
  }
}
