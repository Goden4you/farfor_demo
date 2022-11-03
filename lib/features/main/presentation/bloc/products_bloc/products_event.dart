part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to get all categories and their products
class GetCategoriesAndProductsEvent extends ProductsEvent {}

/// Complete fetching remote config
class CompleteFetchingRemoteConfigEvent extends ProductsEvent {
  final List<CategoryModel> allCategories;

  const CompleteFetchingRemoteConfigEvent({required this.allCategories});

  @override
  List<Object?> get props => [allCategories];
}

/// Event to select category
class SetCurrentCategoryEvent extends ProductsEvent {
  final CategoryModel category;

  const SetCurrentCategoryEvent({required this.category});

  @override
  List<Object?> get props => [category];
}
