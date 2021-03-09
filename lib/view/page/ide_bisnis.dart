part of 'page.dart';

class IdeBisnisPage extends Page<IdeBisnisBloc> {

  @override
  Widget build(BuildContext context) {
    
    int indexOfKategori = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ide Bisnis', style: textTheme.headline6.copyWith(
          color: Colors.white
        )),
        // brightness: Brightness.dark,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24,),
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
          const SizedBox(height: 12),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: Text('Kategori Ide', style: textTheme.headline6.copyWith(
              color: colorScheme['primary']
            )),
            subtitle: Text('Mimpi dan Usaha adalah Kunci', style: textTheme.bodyText2,),
          ),
          StatefulBuilder(
            builder: (context, setState) => Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    itemCount: bloc.listOfKategori.length,
                    separatorBuilder: (_, index) => const SizedBox(width: 12,),
                    itemBuilder: (_, index) => SimpleChip(
                      color: index == indexOfKategori ? colorScheme['primary'] : colorScheme['background3'],
                      onTap: () => setState(() {
                        if (indexOfKategori != index) {
                          indexOfKategori = index;
                        }
                      }),
                      child: Text(bloc.listOfKategori[index], style: textTheme.subtitle2.copyWith(
                        color: index == indexOfKategori ? Colors.white : colorScheme['text1']
                      )),
                    )
                  ),
                ),
                ...List.generate(2, (index) => ContainerRow(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  openWidget: IdeBisnisDetailPage()
                )),
              ],
            )
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            title: Text('Usaha Bidang Makanan', style: textTheme.headline6.copyWith(
              color: colorScheme['primary']
            ))
          ),
          ... List.generate(2, (index) => ContainerRow(
            openWidget: IdeBisnisDetailPage(),
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          ))
        ],
      ),
    );
  }
}