part of 'cart_bloc.dart';

class CartState extends Equatable {
  final StateStatus status;
  final List<ProductModel> allProducts;
  final GlobalKey<CartIconKey>? cartKey;
  final Function(GlobalKey, GlobalKey<CartIconKey>)? addToCartFunction;
  final String? errorMessage;

  const CartState.initial() : this._();

  const CartState._({
    this.status = StateStatus.initial,
    this.allProducts = const [],
    this.cartKey,
    this.addToCartFunction,
    this.errorMessage,
  });

  CartState copyWith({
    StateStatus? status,
    List<ProductModel>? allProducts,
    GlobalKey<CartIconKey>? cartKey,
    Function(GlobalKey, GlobalKey<CartIconKey>)? addToCartFunction,
    String? errorMessage,
  }) =>
      CartState._(
        status: status ?? this.status,
        allProducts: allProducts ?? this.allProducts,
        cartKey: cartKey ?? this.cartKey,
        addToCartFunction: addToCartFunction ?? this.addToCartFunction,
        errorMessage: errorMessage,
      );

  CartState setToDefault() => const CartState.initial();

  @override
  List<Object?> get props =>
      [status, allProducts, cartKey, addToCartFunction, errorMessage];
}
