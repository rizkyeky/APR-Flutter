part of 'component.dart';

class ContainerRow extends StatelessWidget {

  final EdgeInsetsGeometry padding;
  final Widget openWidget;

  const ContainerRow({
    this.openWidget,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(2, (index) => 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              OpenContainer(
                closedColor: Colors.transparent,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                openBuilder: (context, action) => openWidget,
                closedBuilder: (context, action) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(injector.imagePlaceHolder),
                    )
                  ),
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox.expand(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.more_vert, color: Colors.white,)),
                        ],
                      ),
                    ),
                  )
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: (injector.screenWidth/2)-(12*4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ide Usaha Furnitur', style: textTheme.subtitle1.copyWith(
                      color: colorScheme['primary'],
                      fontWeight: FontWeight.bold,
                      height: 1
                    )),
                    Text('< 10 JUTA', style: textTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.normal
                    ))
                  ],
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}