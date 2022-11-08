import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/ui_kit/widgets/custom_image_network.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/presentation/widgets/add_product_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final GlobalKey productKey;
  const ProductCard({Key? key, required this.product, required this.productKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 55) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (kDebugMode)
            Container(
                key: productKey,
                child: Image.asset(
                  AssetsImages.firstProduct,
                  fit: BoxFit.contain,
                ))
          else
            Center(
              child: CustomImageNetwork(
                '${product.imageUrl}',
                cartKey: productKey,
              ),
            ),
          Text(
            product.name ?? 'Нет названия',
            style: AppTextStyles.medium12pt,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  product.cost != null ? '${product.cost} ₽' : 'Бесценно :)',
                  style: AppTextStyles.bold16pt,
                ),
              ),
              AddProductButton(
                product: product,
                productKey: productKey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
