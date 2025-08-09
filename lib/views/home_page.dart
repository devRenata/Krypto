import 'package:flutter/material.dart';
import 'package:krypto/models/remote_storage_repository.dart';
import 'package:krypto/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteRepository = Provider.of<IRemoteStorageRepository>(context, listen: false);
    
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(remoteRepository: remoteRepository),
      child: Scaffold(),
    );
  }
}
