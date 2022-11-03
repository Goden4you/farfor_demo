import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/enums.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/ui_kit/default_app_bar.dart';
import 'package:farfor_demo/core/ui_kit/main_layout.dart';
import 'package:farfor_demo/core/utils/utils.dart';
import 'package:farfor_demo/features/main/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:farfor_demo/features/main/presentation/widgets/category_card.dart';
import 'package:farfor_demo/features/main/presentation/widgets/category_card_skeleton.dart';
import 'package:farfor_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoriesPage extends StatelessWidget {
  static const routeName = '/categories';
  final Function? onPush;
  CategoriesPage({Key? key, this.onPush}) : super(key: key);

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: DefaultAppBar(title: S.of(context).main_page_title),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () {
          BlocProvider.of<ProductsBloc>(context)
              .add(GetCategoriesAndProductsEvent());

          _refreshController.refreshCompleted();
        },
        header: const ClassicHeader(
          completeIcon: null,
          completeText: '',
          completeDuration: Duration.zero,
        ),
        child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              showErrorSnackbar(context, text: state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state.allCategories == null &&
                state.status != StateStatus.loading) {
              return Center(
                child: Text(
                  '${state.errorMessage}',
                  style: AppTextStyles.regular16pt,
                ),
              );
            }

            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.status != StateStatus.loading)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      S.of(context).menu,
                      style: AppTextStyles.bold16pt,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: state.status != StateStatus.loading
                        ? [
                            ...state.allCategories!
                                .map((category) => CategoryCard(
                                      category: category,
                                      onTap: () {
                                        onPush?.call();
                                      },
                                    ))
                          ]
                        : [
                            const CategoryCardSkeleton(),
                            const CategoryCardSkeleton(),
                            const CategoryCardSkeleton(),
                          ],
                  ),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
