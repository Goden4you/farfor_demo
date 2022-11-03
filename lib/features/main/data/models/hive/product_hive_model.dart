import 'package:farfor_demo/features/main/data/models/product_model.dart';
import 'package:hive/hive.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId: 0)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String? name;

  @HiveField(2)
  late String? imageUrl;

  @HiveField(3)
  late int? cost;

  @HiveField(4)
  late String? sizes;

  @HiveField(5)
  late int? categoryId;

  @HiveField(6)
  late int count;

  static ProductHiveModel fromModel(ProductModel item, {required int count}) =>
      ProductHiveModel()
        ..id = item.id
        ..name = item.name
        ..imageUrl = item.imageUrl
        ..cost = item.cost
        ..sizes = item.sizes
        ..categoryId = item.categoryId
        ..count = count;
}
