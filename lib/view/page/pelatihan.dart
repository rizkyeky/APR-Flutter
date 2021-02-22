part of 'page.dart';

class PelatihanPage extends Page<PelatihanBloc> {

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  Widget build(BuildContext context) {
  
    int indexOfKategori1 = 0;
    int indexOfKategori2 = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pelatihan Usaha', style: textTheme.headline6.copyWith(
          color: Colors.white
        )),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24,),
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
          const SizedBox(height: 24,),
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
                ... List.generate(4, (index) => ContainerTile(
                  openWidget: PelatihanDetailPage(),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ))
              ],
            )
          ),
          const SizedBox(height: 24),
          StatefulBuilder(
            builder: (context, setState) => Column(
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(bloc.listOfKategori2.length, (index) => SizedBox(
                    width: injector.screenWidth/2 - 36,
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
                const SizedBox(height: 24,),
                ... List.generate(4, (index) => ContainerTile(
                  openWidget: PelatihanDetailPage(),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ))
              ],
            )
          )
        ],
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