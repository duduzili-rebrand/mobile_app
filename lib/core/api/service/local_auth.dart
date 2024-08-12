abstract class LocalAuth {
  Future<bool> authenticate();
  Future<void> cancelAuthentication();
  Future<bool> get isAvailable;
}
