import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/enums.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/ui_kit/default_app_bar.dart';
import 'package:farfor_demo/core/ui_kit/main_layout.dart';
import 'package:farfor_demo/core/utils/utils.dart';
import 'package:farfor_demo/features/main/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:farfor_demo/features/main/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  static const routeName = '/products';
  final Function()? onPop;
  const ProductsPage({Key? key, this.onPop}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<GlobalKey> _productsKeys = [];

  @override
  void initState() {
    super.initState();
    final _productsState = BlocProvider.of<ProductsBloc>(context).state;
    for (var _ in (_productsState.currentCategory?.products ?? [])) {
      _productsKeys.add(GlobalKey());
    }
  }

  @override
  void dispose() {
    super.dispose();

    for (var key in _productsKeys) {
      key.currentState?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: MainLayout(
            appBar: DefaultAppBar(
              title: context
                      .read<ProductsBloc>()
                      .state
                      .currentCategory
                      ?.categoryName ??
                  '',
              onBackPressed: () {
                widget.onPop?.call();
                Navigator.of(context).pop();
              },
              needBackArrow: true,
            ),
            body: BlocConsumer<ProductsBloc, ProductsState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  showErrorSnackbar(context, text: state.errorMessage);
                }
              },
              buildWhen: (previous, current) =>
                  previous.currentCategory != current.currentCategory,
              builder: (context, state) {
                if (state.status == StateStatus.loading ||
                    state.currentCategory?.products?.isNotEmpty == true &&
                        state.currentCategory?.products?.length !=
                            _productsKeys.length) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                      strokeWidth: 3,
                    ),
                  );
                }

                if (state.currentCategory?.products == null) {
                  return const Center(
                    child: Text(
                      'Не удалось загрузить категорию',
                      style: AppTextStyles.regular16pt,
                    ),
                  );
                }

                if (state.currentCategory?.products?.isEmpty == true) {
                  return const Center(
                    child: Text(
                      'Нет продуктов',
                      style: AppTextStyles.regular16pt,
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 20,
                      children: [
                        for (var i = 0;
                            i < (state.currentCategory?.products?.length ?? 0);
                            i++)
                          ProductCard(
                            product: state.currentCategory!.products![i],
                            productKey: _productsKeys[i],
                          )
                      ],
                    ),
                  ),
                );
              },
            )),
        onWillPop: () async {
          widget.onPop?.call();
          return true;
        });
  }
}
