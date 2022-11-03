import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:farfor_demo/features/main/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required int id,
    required String? imageUrl,
    required String? categoryName,
    required List<ProductModel>? products,
  }) : super(
          id: id,
          imageUrl: imageUrl,
          categoryName: categoryName,
          products: products,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      imageUrl: json['image_url'],
      categoryName: json['category_name'],
      products: (json['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }
}
