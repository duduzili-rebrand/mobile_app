abstract class ICache {
  Future<bool?> isLoggedIn();
  Future<void> setLoggedIn(bool status);
}
