import 'package:flutter/material.dart';
import 'package:krypto/models/coin.dart';
import 'package:krypto/models/remote_storage_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final IRemoteStorageRepository remoteRepository;
  HomeViewModel({required this.remoteRepository});

  List<Coin> coins = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getAllCoins() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      coins = await remoteRepository.getAllCoins();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}