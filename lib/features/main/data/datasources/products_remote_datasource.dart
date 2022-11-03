import 'package:dio/dio.dart';
import 'package:farfor_demo/core/domain/exceptions.dart';
import 'package:farfor_demo/features/main/data/models/category_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<CategoryModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio client;

  ProductsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getProducts() async {
    try {
      final response = await client.get(
          '10b304f7b00ffd17535604f4b38ebe6a/raw/7943e85822e248a1c9a07fa84c0d6909ef0bb937/test.json');

      if (response.data == null) {
        throw ServerException(
            title: 'Internal server error',
            status: 500,
            detail: 'Internal server error');
      }

      return (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw ServerException.fromResponse(
          e.response?.data, e.type, e.response?.statusCode);
    } catch (e, __) {
      throw UnknownException();
    }
  }
}
