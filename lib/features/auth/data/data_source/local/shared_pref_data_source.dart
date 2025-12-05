import 'dart:developer';

import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/auth/data/data_source/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDataSource implements LocalDataSource {
  final SharedPreferences _sharedPreferences;
  SharedPrefDataSource(this._sharedPreferences);
  @override
  Future<String?> getToken() async {
    try {
      final token = _sharedPreferences.getString("token");
      return token;
    } catch (e) {
      log(e.toString());
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<void> setToken({required String token}) async {
    try {
      final isSaved = await _sharedPreferences.setString("token", token);
      if (!isSaved) throw AppException("Some Thing Went Wrong");
    } catch (e) {
      log(e.toString());
      throw AppException("Some Thing Went Wrong");
    }
  }
}
