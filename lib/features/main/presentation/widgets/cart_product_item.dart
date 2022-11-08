import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/ui_kit/widgets/custom_image_network.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  final ProductModel product;
  const CartProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 12, bottom: 17),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          if (kDebugMode)
            Image.asset(
              AssetsImages.firstProduct,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width / 6,
            )
          else
            CustomImageNetwork(
              '${product.imageUrl}',
              borderRadius: BorderRadius.circular(10),
              width: MediaQuery.of(context).size.width / 6,
            ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? 'Нет названия',
                style: AppTextStyles.medium12pt,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.cost != null ? '${product.cost} ₽' : 'Бесценно :)',
                style: AppTextStyles.ultraBold14pt,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      product.sizes ?? 'Вес неизвестен',
                      style: AppTextStyles.medium12pt,
                    ),
                  ),
                  Text(
                    '${product.count} шт.',
                    style: AppTextStyles.medium12pt,
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
