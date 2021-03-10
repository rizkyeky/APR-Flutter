part of 'component.dart';

class ContainerRow extends StatelessWidget {

  final EdgeInsetsGeometry padding;
  final Widget openWidget;
  final List<ServiceResult<Ide>> data;

  const ContainerRow({
    @required this.data,
    @required this.openWidget,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(2, (index) => 
          SizedBox(
            height: 196,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.more_vert, color: Colors.white,)),
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data[index].value.nama, style: textTheme.subtitle1.copyWith(
                      color: colorScheme['primary'],
                      fontWeight: FontWeight.bold,
                      height: 1
                    )),
                    Text('< 10 JUTA', style: textTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.normal
                    ))
                  ],
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}

class SkeletonContainerRow extends StatelessWidget {

  const SkeletonContainerRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Row(
      children: [
        Column(
          children: [
            Skeleton(
              height: 150,
              width: 150,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(height: 6),
            Skeleton(
              width: 150,
              height: 48,
              borderRadius: BorderRadius.circular(6),
              style: SkeletonStyle.text,
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Skeleton(
              height: 150,
              width: 150,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(height: 6),
            Skeleton(
              width: 150,
              height: 48,
              borderRadius: BorderRadius.circular(6),
              style: SkeletonStyle.text,
            ),
          ],
        ),
      ],
    ),
  );
  }
}