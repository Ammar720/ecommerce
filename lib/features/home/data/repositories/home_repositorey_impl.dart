import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/app_exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/category_mappers.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoreyImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoreyImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final response = await _remoteDataSource.getCategories();
      final categories = response.map(
        (categoryModel) {
          return categoryModel.toEntity;
        },
      ).toList();
      return Right(categories);
    } on AppExceptions catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
