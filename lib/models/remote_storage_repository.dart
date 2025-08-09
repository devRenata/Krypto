import 'package:krypto/models/coin.dart';

abstract class IRemoteStorageRepository {
  Future<List<Coin>> getAllCoins();
  Future<List<Coin>> searchCoin({required String query});
}