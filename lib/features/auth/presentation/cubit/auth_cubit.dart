import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final Register _register;
  final Login _login;

  AuthCubit(this._register, this._login) : super(AuthInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final results = await _register(request);
    results.fold(
      (failur) => emit(RegisterError(failur.message)),
      (_) => emit(Registersuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final results = await _login(request);
    results.fold(
      (failur) => emit(LoginError(failur.message)),
      (_) => emit(Loginsuccess()),
    );
  }
}
