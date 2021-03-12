part of 'bloc.dart';

class IdeBisnisDetailBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final KategoriService kategoriService = injector.getService<KategoriService>();

  String str1 = 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est eopksio laborum. Sed ut perspiciatis unde omnis';
  String str2 = 'People who have a creative side and do not live it out are most disagreeable clients. They make a mountain out of a molehill, fuss about unnecessary things, are too passionately in love with somebody who is not worth so much attention, and so on.';
  String str3 = 'There is a kind of floating charge of energy in them which is not attached to its right object and therefore tends to apply exaggerated dynamism to the wrong situation.';
  
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
}
