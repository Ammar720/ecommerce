import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeStates> {
  final GetCategories _getCategories;

  HomeCubit(this._getCategories)
      : super(
          HomeInitial(),
        ) {
    getCategories();
  }

  Future<void> getCategories() async {
    emit(HomeLoading());
    final categories = await _getCategories.getCategories();
    return categories.fold(
      (failure) => emit(HomeError(failure.message)),
      (category) => emit(HomeSuccess(category)),
    );
  }
}
