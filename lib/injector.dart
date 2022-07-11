
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
import 'service/service.dart';
class Injector {
  
  Injector._();
  static Injector instance = Injector._();

  final GetIt _getIt = GetIt.instance;

  Future<void> init() async {
    _getIt.registerLazySingleton(() => ConnectionService());
    _getIt.registerLazySingleton(() => KategoriService());

    _getIt.registerFactory(() => HomeBloc());
    _getIt.registerFactory(() => EntryBloc());
    _getIt.registerFactory(() => ProfileBloc());
    _getIt.registerFactory(() => IdeBisnisBloc());
    _getIt.registerFactory(() => PelatihanBloc());
    _getIt.registerFactory(() => IdeBisnisDetailBloc());
    _getIt.registerFactory(() => PelatihanDetailBloc());

    await _getIt.allReady();
  }

  Future<void> setup() async {
    rebuildNotifier = ValueNotifier(false);
    networkStatusNotifier = ValueNotifier(ConnectionStatus.offline);

    await getService<ConnectionService>().init();
    await cacheImagePlaceHolder('assets/background/content.jpg');
  }

  T getBloc<T extends Bloc>() => _getIt.get<T>();
  T getService<T extends Service>() => _getIt.get<T>();

  late double screenHeight;
  late double screenWidth;

  Uint8List? imagePlaceHolder;
  Future<void> cacheImagePlaceHolder(String path) async {
    final bytes = await rootBundle.load(path);
    imagePlaceHolder = bytes.buffer.asUint8List();
  }

  ValueNotifier<bool>? rebuildNotifier;
  ValueNotifier<ConnectionStatus>? networkStatusNotifier;

  void rebuild() {
    rebuildNotifier?.value = !(rebuildNotifier?.value ?? false);
  }

  final PageController tabController = PageController();
}

final Injector injector = Injector.instance;
