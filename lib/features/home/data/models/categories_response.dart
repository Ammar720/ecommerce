import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/data/models/metadata.dart';

class CategoriesResponse {
  final int results;
  final Metadata metadata;
  final List<CategoryModel> data;

  const CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json['results'] as int,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
