import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddProductButton extends StatelessWidget {
  final ProductModel product;
  final GlobalKey productKey;
  const AddProductButton(
      {Key? key, required this.product, required this.productKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CartBloc>(context)
            .add(AddProductToCartEvent(product: product, key: productKey));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.green,
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGreen.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          AssetsIcons.plus,
        ),
      ),
    );
  }
}
