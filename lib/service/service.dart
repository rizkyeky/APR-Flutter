import 'dart:convert' show json;

// import 'package:business_course/model/model.dart';
import 'package:business_course/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import '../injector.dart';

part 'connection.dart';
part 'api.dart';
part 'kategori.dart';

enum ConnectionStatus { online, offline }

final API _api = API();

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