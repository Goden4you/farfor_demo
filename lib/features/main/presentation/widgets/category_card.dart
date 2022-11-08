import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/ui_kit/widgets/custom_image_network.dart';
import 'package:farfor_demo/features/main/data/models/category_model.dart';
import 'package:farfor_demo/features/main/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final Function onTap;
  const CategoryCard({Key? key, required this.category, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ProductsBloc>(context)
            .add(SetCurrentCategoryEvent(category: category));

        onTap.call();
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 50) / 2,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              spreadRadius: 7,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, kDebugMode ? 13 : 0, 20, 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (kDebugMode)
                Image.asset(
                  AssetsImages.firstCategory,
                  fit: BoxFit.contain,
                )
              else
                Center(
                    child: CustomImageNetwork(
                  '${category.imageUrl}',
                )),
              Padding(
                padding: const EdgeInsets.only(top: kDebugMode ? 8 : 0),
                child: Text(
                  category.categoryName ?? 'Нет названия',
                  style: AppTextStyles.medium14pt,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
