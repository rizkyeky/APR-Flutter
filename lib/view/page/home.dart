part of 'page.dart';

class HomePage extends Page<HomeBloc> {

  HomePage() : super(hasNetworkSnack: true);

  final Size heightAppBar = Size.fromHeight(injector.screenHeight / 9);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: PreferredSize(
      preferredSize: heightAppBar,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme['primary'],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo/logo.png', 
                  height: injector.screenHeight / 24.8 < 36 ? 
                    36 : injector.screenHeight / 24.8,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                    TextSpan(text: 'Hello, ', style: textTheme.headline6.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                    ),),
                    TextSpan(text: 'Username', style: textTheme.headline6.copyWith(
                      color: Colors.white
                    ),),
                    ]
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    body: RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1))
          .whenComplete(injector.rebuild);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24,),
            CarouselSlider.builder(
              itemCount: 3, 
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
              itemBuilder: (_, index, realIndex) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: FutureBuilder<ServiceResult<Ide>>(
                  future: bloc.kategoriService.getIde(index+1),
                  builder: (_, snapshot) => 
                  (snapshot.hasData) ? (snapshot.data.isSucess) ? OpenContainer(
                    openBuilder: (context, action) => IdeBisnisDetailPage(data: snapshot.data.value),
                    closedColor: Colors.transparent,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    closedBuilder: (context, action) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: MemoryImage(injector.imagePlaceHolder),
                        )
                      ),
                      padding: const EdgeInsets.only(left: 24, bottom: 24),
                      alignment: Alignment.bottomLeft,
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: snapshot.data.value.nama, style: textTheme.headline4.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                          ),),
                          const TextSpan(text: '\n'),
                          TextSpan(text: snapshot.data.value.subNama, style: textTheme.headline4.copyWith(
                            color: Colors.white
                          ),)
                        ]),
                        textWidthBasis: TextWidthBasis.parent,
                        maxLines: 2,
                      ) 
                    ),
                  ) : Center(child: Text(snapshot.data.massage)) : Skeleton(
                    width: double.infinity,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  )
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
            ContainerList<Ide>(
              openBuilder: (data) => IdeBisnisDetailPage(data: data),
              future: bloc.kategoriService.getIde,
              containerCount: 3,
              insideBuilder: (_, index, data) => Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Spacer(),
                        SimpleChip(
                          color: Colors.white,
                          child: Text(bloc.listOfContainer1[index]['chip'], style: textTheme.subtitle2)
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(data.subNama, style: textTheme.headline5.copyWith(
                      color: Colors.white
                    )),
                    Text(data.nama, style: textTheme.headline6.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )),
                  ],
                ),
              ),
            ),
            ...List.generate(2, (index) => FutureBuilder<List<ServiceResult<Ide>>>(
              future: bloc.get2Ide(),
              builder: (context, snapshot) => (snapshot.hasData) 
              ? (snapshot.data[index].isSucess)
                ? ContainerRow(
                  data: snapshot.data,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  openWidget: IdeBisnisDetailPage(data: snapshot.data[index].value)
                ) : Center(child: Text(snapshot.data[index].massage),) 
              : const SkeletonContainerRow()
            )),
            Padding(
              padding: const EdgeInsets.all(24),
              child: MainButton(
                label: 'LIHAT SEMUA',
                onPressed: () => injector.tabController.jumpToPage(1),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              title: Text('Pelatihan', style: textTheme.headline6.copyWith(
                color: colorScheme['primary'],
              ),),
              subtitle: Text('Tambahkan Kemampuan Anda', style: textTheme.bodyText1,),
            ),
            ContainerList<Pelatihan>(
              openBuilder: (data) => PelatihanDetailPage(data: data),
              containerCount: 3,
              future: bloc.kategoriService.getPelatihan,
              bottomBuilder: (context, index, data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.nama, style: textTheme.subtitle1.copyWith(
                    height: 1.2,
                    color: colorScheme['primary'],
                    fontWeight: FontWeight.bold,
                  )),
                  Text(bloc.listOfContainer2[index]['subtitle'], style: textTheme.bodyText2)
                ],
              ),
              insideBuilder: (context, index, data) => Padding(
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
            ...List.generate(3, (index) => FutureBuilder<ServiceResult<Pelatihan>>(
              future: bloc.kategoriService.getPelatihan(index+1),
              builder: (context, snapshot) => (snapshot.hasData) ? (snapshot.data.isSucess)
              ? ContainerTile(
                data: snapshot.data.value,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ) : Center(child: Text(snapshot.data.massage)) : const SkeletonContainerTile()
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: MainButton(
                label: 'LIHAT SEMUA',
                onPressed: () => injector.tabController.jumpToPage(2),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}





