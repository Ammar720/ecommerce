import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/app_exceptions.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories_response.dart';
import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteApiDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteApiDataSource(this._dio);
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dio.get(
        APIConstants.categoriesEndPoint,
      );
      return CategoriesResponse.fromJson(response.data).data;
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Faild to get categories');
    }
  }
}
