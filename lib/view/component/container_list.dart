part of 'component.dart';

class ContainerList extends StatelessWidget {

  final EdgeInsetsGeometry padding;
  final Widget Function(BuildContext, int) bottomBuilder;
  final Widget Function(BuildContext, int) insideBuilder;
  final int containerCount;
  final double containerWidth;
  final double containerHeight;
  final double expandHeight;

  const ContainerList({
    this.bottomBuilder,
    this.insideBuilder,
    this.containerCount,
    this.expandHeight = 64,
    this.containerWidth = 220,
    this.containerHeight = 280,
    this.padding = const EdgeInsets.symmetric(horizontal: 24)
  });

  Widget buildContainer(BuildContext context, int index) => SizedBox(
    width: containerWidth,
    height: containerHeight,
    child: ContainerImage(
      child: (insideBuilder != null) ? insideBuilder(context, index) : null
    ),
  );

  @override
  Widget build(BuildContext context) => SizedBox(
    height: (bottomBuilder != null) ? containerHeight + expandHeight : containerHeight,
    child: ListView.separated(
      padding: padding,
      scrollDirection: Axis.horizontal,
      itemCount: containerCount,
      separatorBuilder: (_, i) => SizedBox(width: i != containerCount-1 ? 24 : 0),
      itemBuilder: (context, index) => (bottomBuilder != null) ? SizedBox(
        width: containerWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // textBaseline: TextBaseline.alphabetic,
          children: [
            // Container(height: 100, width: 50, color: Colors.grey,),
            // Container(height: 100, width: 50, color: Colors.amber,),
            buildContainer(context, index),
            bottomBuilder(context, index),
          ],
        ),
      ) : buildContainer(context, index)
    ) ,
  );
}