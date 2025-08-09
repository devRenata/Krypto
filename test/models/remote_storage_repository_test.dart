import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:krypto/models/coin.dart';
import 'package:krypto/models/remote_storage_repository.dart';
import 'package:krypto/models/remote_storage_repository_imp.dart';

void main() async {
  late IRemoteStorageRepository repository;

  setUpAll(() async {
    await dotenv.load(fileName: "../../.env");
    repository = RemoteStorageRepositoryImp(dio: Dio());
  });

  test('Should get a list of currencies with 20 items', () async {
    final coins = await repository.getAllCoins();
    expect(coins, isA<List<Coin>>());
    expect(coins.length, equals(20));
  });
}