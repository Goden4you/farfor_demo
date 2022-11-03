import 'package:farfor_demo/core/constants/strings.dart';
import 'package:farfor_demo/core/domain/exceptions.dart';
import 'package:farfor_demo/features/main/data/models/hive/product_hive_model.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CartLocalDataSource {
  Future<List<ProductHiveModel>> getSavedProducts();
  Future<bool> addSavedProduct(ProductHiveModel product);
  Future<bool> removeSavedProducts();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  const CartLocalDataSourceImpl();

  @override
  Future<List<ProductHiveModel>> getSavedProducts() async {
    try {
      late final Box box;
      if (Hive.isBoxOpen(HiveBoxes.basketList)) {
        box = Hive.box<ProductHiveModel>(HiveBoxes.basketList);
      } else {
        box = await Hive.openBox<ProductHiveModel>(HiveBoxes.basketList);
      }

      return box.isEmpty
          ? []
          : box.keys.map((key) => box.get(key) as ProductHiveModel).toList();
    } on PlatformException catch (_) {
      throw CacheException();
    } catch (e, __) {
      throw UnknownException();
    }
  }

  @override
  Future<bool> addSavedProduct(ProductHiveModel product) async {
    try {
      late final Box box;
      if (Hive.isBoxOpen(HiveBoxes.basketList)) {
        box = Hive.box<ProductHiveModel>(HiveBoxes.basketList);
      } else {
        box = await Hive.openBox<ProductHiveModel>(HiveBoxes.basketList);
      }

      await box.put(product.id, product);

      return true;
    } on PlatformException catch (_) {
      throw CacheException();
    } catch (e, __) {
      throw UnknownException();
    }
  }

  @override
  Future<bool> removeSavedProducts() async {
    try {
      late final Box box;
      if (Hive.isBoxOpen(HiveBoxes.basketList)) {
        box = Hive.box<ProductHiveModel>(HiveBoxes.basketList);
      } else {
        box = await Hive.openBox<ProductHiveModel>(HiveBoxes.basketList);
      }

      await box.clear();

      return true;
    } on PlatformException catch (_) {
      throw CacheException();
    } catch (e, __) {
      throw UnknownException();
    }
  }
}
