import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String? name;
  final String? imageUrl;
  final int? cost;
  final String? sizes;
  final int? categoryId;
  final int count;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.sizes,
    required this.categoryId,
    this.count = 1,
  });

  @override
  List<Object?> get props =>
      [id, name, imageUrl, cost, sizes, categoryId, count];
}
