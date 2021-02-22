part of 'page.dart';

class HomePage extends Page<HomeBloc> {

  HomePage() : super(hasNetworkSnack: true);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final Size heightAppBar = const Size.fromHeight(84);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: PreferredSize(
      preferredSize: heightAppBar,
      child: Material(
        color: colorScheme['primary'],
        child: SizedBox.fromSize(
          size: heightAppBar,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo/logo.png', height: 36, width: 47),
                  Row(
                    children: [
                      Text('Hello, ', style: textTheme.headline6.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white
                      ),),
                      Text('Username', style: textTheme.headline6.copyWith(
                        color: Colors.white
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    body: ListView(
      children: [
        const SizedBox(height: 24,),
        CarouselSlider.builder(
          itemCount: 4, 
          options: CarouselOptions(
            viewportFraction: 1,
            height: 300,
          ),
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox.expand(
              child: ContainerImage(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 24),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text('Belajar', style: textTheme.headline4.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white
                      ),),
                      Text('Ide Bisnis', style: textTheme.headline4.copyWith(
                        color: Colors.white
                      )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ),
        const SizedBox(height: 24,),
        SizedBox(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Selamat Datang di', style: textTheme.subtitle2,),
              Text('APLIKASI PERKREDITAN RAKYAT', style: textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme['primary']
              ),),
              Text('Sebuah Aplikasi Kredit Untuk Produktif', style: textTheme.subtitle2),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: MainButton(
            color: colorScheme['primary'],
            onPressed: () async => showPengajuanSheet(context),
            label: 'AJUKAN',
            labelStyle: textTheme.button.copyWith(color: Colors.white),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: Text('Ide Bisnis', style: textTheme.headline6.copyWith(
            color: colorScheme['primary'],
          ),),
          subtitle: Text('Wujudkan Ide Bisnis Anda', style: textTheme.bodyText1,),
        ),
        ContainerList(
          containerCount: 3,
          insideBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children:  [
                    const Spacer(),
                    SimpleChip(
                      color: Colors.white,
                      child: Text(bloc.listOfContainer1[index]['chip'], style: textTheme.subtitle2)
                    )
                  ],
                ),
                const Spacer(),
                Text(bloc.listOfContainer1[index]['overline'], style: textTheme.headline5.copyWith(
                  color: Colors.white
                )),
                Text(bloc.listOfContainer1[index]['title'], style: textTheme.headline6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )),
              ],
            ),
          ),
        ),
        ...List.generate(2, (index) => ContainerRow(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          openWidget: IdeBisnisDetailPage()
        )),
        Padding(
          padding: const EdgeInsets.all(24),
          child: MainButton(
            label: 'LIHAT SEMUA',
            color: colorScheme['accent2'],
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: Text('Pelatihan', style: textTheme.headline6.copyWith(
            color: colorScheme['primary'],
          ),),
          subtitle: Text('Tambahkan Kemampuan Anda', style: textTheme.bodyText1,),
        ),
        ContainerList(
          containerCount: 3,
          bottomBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bloc.listOfContainer2[index]['title'], style: textTheme.subtitle1.copyWith(
                height: 1.2,
                color: colorScheme['primary'],
                fontWeight: FontWeight.bold,
              )),
              Text(bloc.listOfContainer2[index]['subtitle'], style: textTheme.bodyText2)
            ],
          ),
          insideBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 12, top: 12),
            child: Align(
              alignment: Alignment.topRight,
              child: SimpleChip(
                color: Colors.white,
                child: Text(bloc.listOfContainer2[index]['chip'], style: textTheme.subtitle2)
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('TERPOPULER', style: textTheme.headline6.copyWith(
            color: colorScheme['primary']
          )),
        ),
        ...List.generate(3, (index) => ContainerTile(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          openWidget: PelatihanDetailPage(),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: MainButton(
            label: 'LIHAT SEMUA',
            color: colorScheme['accent2'],
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}





