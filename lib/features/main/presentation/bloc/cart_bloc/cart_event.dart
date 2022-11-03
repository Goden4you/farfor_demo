part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Event to add product to basket
class AddProductToCartEvent extends CartEvent {
  final ProductModel product;
  final GlobalKey key;

  const AddProductToCartEvent({required this.product, required this.key});

  @override
  List<Object?> get props => [product, key];
}

/// Event to remove all products from cart
class RemoveAllProductcFromCartEvent extends CartEvent {}

/// Event to remove product from basket
class GetSavedCartProductsEvent extends CartEvent {
  final GlobalKey<CartIconKey> cartKey;
  final Function(GlobalKey, GlobalKey<CartIconKey>) function;

  const GetSavedCartProductsEvent(
      {required this.cartKey, required this.function});

  @override
  List<Object?> get props => [cartKey, function];
}
