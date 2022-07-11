part of 'page.dart';

class PelatihanDetailPage extends Page<PelatihanDetailBloc> {
  
  final Pelatihan data;

  PelatihanDetailPage({
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Material(
        color: colorScheme['background2'],
        child: SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.nama!, style: textTheme.bodyText1),
                  Text('Rp. 30.000', style: textTheme.headline6?.copyWith(
                    color: colorScheme['primary']
                  ))
                ],
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme['primary'],
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: Text('DAFTARKAN', style: textTheme.bodyText1?.copyWith(
                  color: Colors.white
                ),)
              )
            ],
          ),
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
                  image: MemoryImage(injector.imagePlaceHolder!),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.nama!, style: textTheme.headline5?.copyWith(
                      color: Colors.white
                    )),
                  ],
                ),
              ),
            ),
            expandedHeight: 400,
            collapsedHeight: 140,
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
                    child: Text(label, style: textTheme.subtitle2?.copyWith(
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
                  ],
                ),
              ),
              ...['Pertama', 'Kedua', 'Ketiga', 'Keempat'].map((value) => ExpansionTahapan(
                title: 'Tahapan $value',
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.grey,
                    child: Icon(Icons.play_circle_outline, color: colorScheme['primary'], size: 50),
                  ),
                  const SizedBox(height: 24),
                  Text(bloc.str1, style: textTheme.bodyText1?.copyWith()),
                ],
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Ide Baru', style: textTheme.subtitle1?.copyWith(
                  color: colorScheme['primary']
                )),
              ),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (_, i) => const SizedBox(width: 12),
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
                        child: Text('Ide Bisnis Usaha furniture', style: textTheme.subtitle2?.copyWith(
                          color: colorScheme['primary']
                        ))
                      )
                    ],
                  )
                )
              ),
              const SizedBox(height: 24),
              ContainerList<Pelatihan>(
                openBuilder: (data) => PelatihanDetailPage(data: data),
                containerCount: 3,
                future: bloc.kategoriService.getPelatihan,
                bottomBuilder: (context, index, data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.nama!, style: textTheme.subtitle1?.copyWith(
                      height: 1.2,
                      color: colorScheme['primary'],
                      fontWeight: FontWeight.bold,
                    )),
                    Text(bloc.listOfContainer2[index]['subtitle']!, style: textTheme.bodyText2)
                  ],
                ),
                insideBuilder: (context, index, data) => Padding(
                  padding: const EdgeInsets.only(right: 12, top: 12),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SimpleChip(
                      color: Colors.white,
                      child: Text(bloc.listOfContainer2[index]['chip']!, style: textTheme.subtitle2)
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60+24.0),
            ])
          )
        ],
      ),
    );
  }
}

class ExpansionTahapan extends StatelessWidget {

  final List<Widget> children;
  final String? title;

  const ExpansionTahapan({
    required this.children,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: colorScheme['primary'], fontFamily: 'Poppins'),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24),
        title: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme['background3'],
            borderRadius: BorderRadius.circular(12)
          ),
          child: Text(title ?? '', style: textTheme.subtitle1?.copyWith(
            color: colorScheme['primary']
          )),
        ),
        childrenPadding: const EdgeInsets.all(24),
        children: children,
      ),
    );
  }
}