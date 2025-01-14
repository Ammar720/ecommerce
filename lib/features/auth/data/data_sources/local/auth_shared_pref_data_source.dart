import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/app_exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharedPref;

  AuthSharedPrefDataSource(this._sharedPref);
  @override
  Future<void> saveToken(String token) async {
    try {
      await _sharedPref.setString(ChacheConstants.tokenKey, token);
    } catch (error) {
      throw const LocalExceptions('Faild to save token');
    }
  }

  @override
  Future<String> getToken() async {
    try {
      return _sharedPref.getString(ChacheConstants.tokenKey)!;
    } catch (error) {
      throw const LocalExceptions('Faild to get token');
    }
  }
}
