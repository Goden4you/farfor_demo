import 'package:equatable/equatable.dart';
import 'package:farfor_demo/features/main/data/models/product_model.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String? imageUrl;
  final String? categoryName;
  final List<ProductModel>? products;

  const CategoryEntity({
    required this.id,
    required this.imageUrl,
    required this.categoryName,
    required this.products,
  });

  @override
  List<Object?> get props => [id, imageUrl, categoryName, products];
}
