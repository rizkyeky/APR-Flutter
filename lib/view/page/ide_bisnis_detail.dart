part of 'page.dart';

class IdeBisnisDetailPage extends Page<IdeBisnisDetailBloc> {

  final Ide data;

  IdeBisnisDetailPage({
    this.data,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: colorScheme['background2'],
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                width: injector.screenWidth-(200*0.8),
                child: Text(data.nama, style: textTheme.bodyText1)
              ),
            ),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: colorScheme['primary'],
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: Text('WUJUDKAN', style: textTheme.bodyText1.copyWith(
                color: Colors.white
              ),)
            )
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(injector.imagePlaceHolder),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.tanggalUpdate, style: textTheme.headline6.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )),
                    Text(data.nama, style: textTheme.headline5.copyWith(
                      color: Colors.white
                    )),
                  ],
                ),
              ),
            ),
            expandedHeight: 400,
            collapsedHeight: 170,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: ['JASA', 'SERTIFIKAT', '123 MENIT', 'KONSULTASI', 'EXCLUSIVE'].map((label) => SimpleChip(
                    color: colorScheme['background3'],
                    child: Text(label, style: textTheme.subtitle2.copyWith(
                      color: colorScheme['primary'],
                    ))
                  )).toList()
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  children: [
                    Text(bloc.str1, style: textTheme.bodyText1),
                    const SizedBox(height: 24,),
                    Text(bloc.str2, style: textTheme.bodyText1),
                    const SizedBox(height: 24,),
                    Text(bloc.str3, style: textTheme.bodyText1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Ide Baru', style: textTheme.subtitle1.copyWith(
                  color: colorScheme['primary']
                )),
              ),
              SizedBox(
                height: 160,
                child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (_, i) => const SizedBox(width: 24),
                  itemBuilder: (_, i) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 120,
                        height: 120,
                        child: ContainerImage(),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text('Ide Bisnis Usaha furniture', style: textTheme.subtitle2.copyWith(
                          color: colorScheme['primary']
                        ))
                      )
                    ],
                  )
                )
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 24+60.0),
            ])
          )
        ],
      ),
    );
  }
}