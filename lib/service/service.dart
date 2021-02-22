import 'dart:convert' show json;

import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import '../injector.dart';
import '../model/model.dart';

part 'connection.dart';
part 'api.dart';
part 'kategori.dart';

enum ConnectionStatus { online, offline }

final API _api = injector.getService<API>();

abstract class Service {
  void init();
  void dispose();
}

class ServiceResult<T> {
  String massage;
  T value;
  bool isSucess;

  ServiceResult({this.massage, this.value, this.isSucess});
}