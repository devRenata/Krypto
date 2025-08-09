import 'package:dio/dio.dart';
import 'package:krypto/models/remote_storage_repository.dart';
import 'package:krypto/models/remote_storage_repository_imp.dart';
import 'package:krypto/viewmodels/home_view_model.dart';

class DependenciesFactory {
  static final Dio dio = Dio();

  static final IRemoteStorageRepository remoteRepository = RemoteStorageRepositoryImp(dio: dio);

  static HomeViewModel createHomeViewModel() {
    return HomeViewModel(remoteRepository: remoteRepository);
  }
}