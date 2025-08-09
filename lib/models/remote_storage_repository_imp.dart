import 'package:dio/dio.dart';
import 'package:krypto/models/coin.dart';
import 'package:krypto/models/remote_storage_repository.dart';

class RemoteStorageRepositoryImp implements IRemoteStorageRepository {
  final String apiKey;
  final Dio dio;

  RemoteStorageRepositoryImp({
    required this.dio,
    required this.apiKey,
  });

  @override
  Future<List<Coin>> searchCoin({required String query}) async {
    throw UnimplementedError();
  }
  
  @override
  Future<List<Coin>> getAllCoins() {
    throw UnimplementedError();
  }
}
