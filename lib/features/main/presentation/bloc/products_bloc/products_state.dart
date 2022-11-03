part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final StateStatus status;
  final List<CategoryModel>? allCategories;
  final CategoryModel? currentCategory;
  final int? unavailableCategoryId;
  final String? errorMessage;

  const ProductsState.initial() : this._();

  const ProductsState._({
    this.status = StateStatus.initial,
    this.allCategories,
    this.currentCategory,
    this.unavailableCategoryId,
    this.errorMessage,
  });

  ProductsState copyWith({
    StateStatus? status,
    List<CategoryModel>? allCategories,
    CategoryModel? currentCategory,
    int? unavailableCategoryId,
    String? errorMessage,
  }) =>
      ProductsState._(
        status: status ?? this.status,
        allCategories: allCategories ?? this.allCategories,
        currentCategory: currentCategory ?? this.currentCategory,
        unavailableCategoryId:
            unavailableCategoryId ?? this.unavailableCategoryId,
        errorMessage: errorMessage,
      );

  ProductsState setToDefault() => const ProductsState.initial();

  @override
  List<Object?> get props => [
        status,
        allCategories,
        currentCategory,
        unavailableCategoryId,
        errorMessage
      ];
}
