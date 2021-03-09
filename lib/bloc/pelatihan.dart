part of 'bloc.dart';

class PelatihanBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final KategoriService kategoriService = injector.getService<KategoriService>();

  List<String> listOfKategori = [
    'SEMUA',
    '< 10 JUTA',
    '< 20 JUTA',
    '< 30 JUTA',
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

  List<Map<String, String>> listOfKategori2 = [
    {
      'label': 'JASA',
      'icon': 'assets/logo/gem.svg',
    },
    {
      'label': 'MAKANAN',
      'icon': 'assets/logo/makanan.svg',
    },
    {
      'label': 'MUSIK',
      'icon': 'assets/logo/musik.svg',
    },
    {
      'label': 'OLEHOLEH',
      'icon': 'assets/logo/oleh.svg',
    },
  ];
}
