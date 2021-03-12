part of 'page.dart';

class PelatihanPage extends Page<PelatihanBloc> {

  @override
  Widget build(BuildContext context) {
  
    var indexOfKategori1 = 0;
    var indexOfKategori2 = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pelatihan Usaha', style: textTheme.headline6.copyWith(
          color: Colors.white
        )),
        elevation: 0,
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
              const SizedBox(height: 24,),
              StatefulBuilder(
                builder: (context, setState) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        itemCount: bloc.listOfKategori.length,
                        separatorBuilder: (_, index) => const SizedBox(width: 12,),
                        itemBuilder: (_, index) => SimpleChip(
                          color: index == indexOfKategori1 ? colorScheme['primary'] : colorScheme['background3'],
                          onTap: () => setState(() {
                            if (indexOfKategori1 != index) {
                              indexOfKategori1 = index;
                            }
                          }),
                          child: Text(bloc.listOfKategori[index], style: textTheme.subtitle2.copyWith(
                            color: index == indexOfKategori1 ? Colors.white : colorScheme['text1']
                          )),
                        )
                      ),
                    ),
                    ...List.generate(3, (index) => FutureBuilder<ServiceResult<Pelatihan>>(
                      future: bloc.kategoriService.getPelatihan(index+1),
                      builder: (context, snapshot) => (snapshot.hasData) ? (snapshot.data.isSucess)
                      ? ContainerTile(
                        data: snapshot.data.value,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ) : Center(child: Text(snapshot.data.massage)) : const SkeletonContainerTile()
                    )),
                  ],
                )
              ),
              const SizedBox(height: 24),
              StatefulBuilder(
                builder: (context, setState) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(bloc.listOfKategori2.length, (index) => SizedBox(
                          width: injector.screenWidth/2 - 30,
                          child: OptionButton(
                            label: bloc.listOfKategori2[index]['label'],
                            labelStyle: textTheme.subtitle1.copyWith(
                              color: (indexOfKategori2 == index) ? Colors.white : colorScheme['text1']
                            ),
                            icon: SvgPicture.asset(bloc.listOfKategori2[index]['icon'],
                              color: (indexOfKategori2 == index) ? Colors.white : colorScheme['text1'],
                              height: 24,
                            ),
                            color: (indexOfKategori2 == index) ? colorScheme['primary'] : null,
                            onTap: () => setState(() {
                              indexOfKategori2 = index;
                            }),
                          ),
                        ))
                      ),
                    ),
                    const SizedBox(height: 24,),
                    ...List.generate(3, (index) => FutureBuilder<ServiceResult<Pelatihan>>(
                      future: bloc.kategoriService.getPelatihan(index+1),
                      builder: (context, snapshot) => (snapshot.hasData) ? (snapshot.data.isSucess)
                      ? ContainerTile(
                        data: snapshot.data.value,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ) : Center(child: Text(snapshot.data.massage)) : const SkeletonContainerTile()
                    )),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {

  final String label;
  final TextStyle labelStyle;
  final Widget icon;
  final void Function() onTap;
  final Color color;

  const OptionButton({
    this.label,
    this.labelStyle,
    this.icon,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? const Color(0xFFBCE0FD),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 12,),
              Text(label, style: labelStyle ?? textTheme.subtitle1.copyWith(
                color: Colors.white,
              )),
            ],
          ),
        ),
      ),
    );
  }
}