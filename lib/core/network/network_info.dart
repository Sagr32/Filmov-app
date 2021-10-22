/// network info
abstract class NetworkInfo {
  /// check if the device is connected or not
  Future<bool> get isConnected;
}
