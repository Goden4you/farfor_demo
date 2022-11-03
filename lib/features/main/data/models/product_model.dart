import 'package:farfor_demo/features/main/data/models/hive/product_hive_model.dart';
import 'package:farfor_demo/features/main/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required int id,
    required String? name,
    required String? imageUrl,
    required int? cost,
    required String? sizes,
    required int? categoryId,
    int count = 1,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          cost: cost,
          sizes: sizes,
          categoryId: categoryId,
          count: count,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      cost: json['cost'],
      sizes: json['sizes'],
      categoryId: json['category_id'],
    );
  }

  factory ProductModel.fromHive(ProductHiveModel hive) => ProductModel(
        id: hive.id,
        name: hive.name,
        imageUrl: hive.imageUrl,
        cost: hive.cost,
        sizes: hive.sizes,
        categoryId: hive.categoryId,
        count: hive.count,
      );

  ProductModel increaseCount() => ProductModel(
        id: id,
        name: name,
        imageUrl: imageUrl,
        cost: cost,
        sizes: sizes,
        categoryId: categoryId,
        count: count + 1,
      );
}
