part of 'service.dart';

class KategoriService implements Service {
  
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {

  }

  final http.Client _client = http.Client();
  
  Future<ServiceResult<List<Ide>>> getIdeAll() async {
    try {      
      // debugPrint(_api.ideAll.toString());
      
      final http.Response response = await _client.post(_api.ideAll, body: {
        'id_ide': ''
      })
        .timeout(const Duration(seconds: 10));

      final data = json.decode(response.body) as Map;
      final results = data['results'] as List;

      // debugPrint(data.toString());

      if (response.statusCode != 200) {
        return ServiceResult(massage: 'not success', isSucess: false);
      } else {
        return ServiceResult(
          value: results.map(
            (json) => Ide.fromJson(json as Map)
          )
            .toList(),
          isSucess: true,
        );
      }
    } catch (e) {
      final error = e.toString().substring(0, e.toString().indexOf(':'));
      return ServiceResult(massage: 'not success $error', isSucess: false);
    }
  }

  Future<ServiceResult<Ide>> getIde(int index) async {
    try {      
      debugPrint(_api.ide.toString());
      
      final http.Response response = await _client.post(_api.ide, body: {
        'id_ide': index.toString()
      })
        .timeout(const Duration(seconds: 10));

      final data = json.decode(response.body) as Map;
      final results = data['results'] as List;

      debugPrint(data.toString());
      debugPrint(results.toString());

      if (response.statusCode != 200) {
        return ServiceResult(massage: 'not success', isSucess: false);
      } else {
        return ServiceResult(
          value: Ide.fromJson(results[0] as Map)
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      final error = e.toString().substring(0, e.toString().indexOf(':'));
      return ServiceResult(massage: 'not success $error', isSucess: false);
    }
  }

  Future<ServiceResult<List<Pelatihan>>> getPelatihanAll() async {
    try {
      // debugPrint(_api.pelatihanAll.toString());

      final http.Response response = await _client.post(_api.pelatihanAll, body: {
        'id_ide': ''
      })
        .timeout(const Duration(seconds: 10));

      final data = json.decode(response.body) as Map;
      final results = data['results'] as List;

      if (response.statusCode != 200) {
        return ServiceResult(massage: 'not success StatusCode', isSucess: false);
      } else {
        return ServiceResult(
          value: results.map(
            (json) => Pelatihan.fromJson(json as Map)
          )
            .toList(),
          isSucess: true,
        );
      }
    } catch (e) {
      final error = e.toString().substring(0, e.toString().indexOf(':'));
      return ServiceResult(massage: 'not success $error', isSucess: false);
    }
  }

}