part of 'service.dart';
class API {

  // final String _homeBase = 'sheetdb.io';
  // final String _subBase = 'api/v1/y06kd2tyjoxaf';

  final String _homeBase = '34.101.181.128';
  final String _subBase = 'APR';

  Uri get ideAll => Uri.http(_homeBase, '$_subBase/AprIde/readAll');
  Uri get pelatihanAll => Uri.http(_homeBase, '$_subBase/AprPelatihan/readAll');
}