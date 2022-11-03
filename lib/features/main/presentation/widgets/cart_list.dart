import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/presentation/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final List<ProductModel> products;
  const CartList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return CartProductItem(
          product: products[index],
        );
      },
    );
  }
}
