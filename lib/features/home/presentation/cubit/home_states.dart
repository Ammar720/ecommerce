import 'package:ecommerce/features/home/domain/entities/category.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeError extends HomeStates {
  final String message;

  HomeError(this.message);
}

class HomeSuccess extends HomeStates {
  final List<Category> categories;

  HomeSuccess(this.categories);
}
