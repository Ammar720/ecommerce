import 'package:ecommerce/features/home/data/models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}
