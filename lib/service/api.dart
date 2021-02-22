part of 'service.dart';
class API implements Service {

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final String _homeBase = '34.101.181.128';
  final String _subBase = 'APR';

  Uri get ideAll => Uri.http(_homeBase, '$_subBase/AprIde/readAll');
  Uri get pelatihanAll => Uri.http(_homeBase, '$_subBase/AprPelatihan/readAll');
}
