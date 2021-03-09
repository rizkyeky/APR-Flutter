part of 'bloc.dart';

class HomeBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final KategoriService _kategoriService = injector.getService<KategoriService>();

  List<Ide> _listIdeBisnis = [];
  List<Pelatihan> _listPelatihan = [];

  Future<List<Ide>> getIdeList({int index, int count}) async {
    if (_listIdeBisnis.isEmpty) {
      final result = await _kategoriService.getIdeAll();
      if (result.isSucess) {
        if (count != null) {
          _listIdeBisnis = result.value.sublist(0, count);
        }
      }
    }
    return _listIdeBisnis;
  }

  Future<List<Pelatihan>> getPelatihanList({int index, int count}) async {
    if (_listIdeBisnis.isEmpty) {
      final result = await _kategoriService.getPelatihanAll();
      if (result.isSucess) {
        if (count != null) {
          _listPelatihan = result.value.sublist(0, count);
        } else {
          _listPelatihan = result.value;
        }
      }
    }
    return _listPelatihan;
  } 

  List<Map<String, String>> listOfContainer1 = [
    {
      'overline': 'Bidang Jasa',
      'title': 'Mencoba Usaha Furnitur',
      'chip': '< 10 JUTA'
    },
    {
      'overline': 'Bidang Jasa',
      'title': 'Mencoba Usaha Furnitur',
      'chip': '< 2 JUTA'
    },
    {
      'overline': 'Bidang Jasa',
      'title': 'Mencoba Usaha Keramik',
      'chip': '< 5 JUTA'
    }
  ];

  List<Map<String, String>> listOfContainer2 = [
    {
      'title': 'Pelatihan Untuk Membuat Furniture',
      'subtitle': 'Gratis',
      'chip': 'GRATIS'
    },
    {
      'title': 'Pelatihan Untuk Membuat Furniture',
      'subtitle': 'Member',
      'chip': 'MEMBER'
    },
    {
      'title': 'Pelatihan Untuk Membuat Furniture',
      'subtitle': 'Member',
      'chip': 'MEMBER'
    },
  ];
  
}
