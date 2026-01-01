abstract class LocalDataSource {
  Future<void> setToken({required String token});
  Future<String?> getToken();
  Future<void> clearToken();
}
