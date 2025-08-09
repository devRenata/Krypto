import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:krypto/models/coin.dart';
import 'package:krypto/models/remote_storage_repository.dart';

class RemoteStorageRepositoryImp implements IRemoteStorageRepository {
  final Dio dio;

  RemoteStorageRepositoryImp({
    required this.dio,
  });

  @override
  Future<List<Coin>> searchCoin({required String query}) async {
    throw UnimplementedError();
  }
  
  @override
  Future<List<Coin>> getAllCoins() async {
    try {
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets',
        queryParameters: {
          'vs_currency': 'usd',
          'per_page': 20,
        },
        options: Options(
          headers: {
            'x-cg-pro-api-key': dotenv.env['API_KEY'],
          },
        ),
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => Coin.fromJson(json))
            .toList();
      } else {
        throw HttpException('Falha ao buscar lista de moedas. Código HTTP: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha ao buscar lista de moedas, tente novamente.');
    }
  }
}
