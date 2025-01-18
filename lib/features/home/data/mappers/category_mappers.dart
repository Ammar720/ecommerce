import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';

extension CategoryMappers on CategoryModel {
  Category get toEntity => Category(
        id: id,
        name: name,
        image: image,
      );
}
