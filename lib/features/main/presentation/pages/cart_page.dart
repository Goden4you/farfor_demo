import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/enums.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/ui_kit/default_app_bar.dart';
import 'package:farfor_demo/core/ui_kit/main_layout.dart';
import 'package:farfor_demo/core/utils/utils.dart';
import 'package:farfor_demo/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:farfor_demo/features/main/presentation/widgets/cart_list.dart';
import 'package:farfor_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: DefaultAppBar(
        title: S.of(context).cart,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CartBloc>(context)
                  .add(RemoveAllProductcFromCartEvent());
            },
            icon: const Icon(
              Icons.delete_forever_outlined,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showErrorSnackbar(context, text: state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.red,
                strokeWidth: 3,
              ),
            );
          }

          if (state.allProducts.isEmpty) {
            return Center(
              child: Text(
                S.of(context).cart_is_empty,
                style: AppTextStyles.regular16pt,
              ),
            );
          }

          return CartList(products: state.allProducts);
        },
      ),
    );
  }
}
