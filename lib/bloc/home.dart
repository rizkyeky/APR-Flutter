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

  List<Kategori> _listIdeBisnis = [];
  List<Kategori> _listPelatihan = [];

  Future<List<Kategori>> getIdeBinisList() async {
    // if (_listIdeBisnis.isEmpty) {
    //   final result = await _kategoriService.getKategori();
    //   if (result.isSucess) {
    //     _listIdeBisnis = result.value;
    //     _listIdeBisnis.removeWhere((element) => element.jenis == 'IDE BISNIS');
    //   }
    // }
    return _listIdeBisnis;
  }

  Future<List<Kategori>> getPelatihanList() async {
    // if (_listPelatihan.isEmpty) {
    //   final result = await _kategoriService.getKategori();
    //   if (result.isSucess) {
    //     // _listPelatihan = result.value;
    //     _listPelatihan.removeWhere((element) => element.jenis == 'PELATIHAN');
    //   }
    // }
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
