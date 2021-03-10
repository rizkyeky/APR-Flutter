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

  final KategoriService kategoriService = injector.getService<KategoriService>();

  Future<List<ServiceResult<Ide>>> get2Ide() async {
    final list = <ServiceResult<Ide>>[];
    for (var i = 0; i < 2; i++) {
      list.add(await kategoriService.getIde(i+1));
    }
    return list;
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
