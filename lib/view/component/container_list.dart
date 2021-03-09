part of 'component.dart';

class ContainerList<T> extends StatelessWidget {

  final EdgeInsetsGeometry padding;
  final Widget Function(BuildContext, int) bottomBuilder;
  final Widget Function(BuildContext, int) insideBuilder;
  final int containerCount;
  final double containerWidth;
  final double containerHeight;
  final double expandHeight;
  final Future<T> Function(int) future;

  const ContainerList({
    this.bottomBuilder,
    this.insideBuilder,
    this.containerCount,
    this.future,
    this.expandHeight = 64,
    this.containerWidth = 220,
    this.containerHeight = 280,
    this.padding = const EdgeInsets.symmetric(horizontal: 24)
  });

  Widget buildContainer(BuildContext context, int index) => SizedBox(
    width: containerWidth,
    height: containerHeight,
    child: FutureBuilder<T>(
      future: future(index),
      builder: (context, snapshot) => 
      (snapshot.connectionState == ConnectionState.done) ? ContainerImage(
        child: (insideBuilder != null) ? insideBuilder(context, index) : null
      ) : Skeleton(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final height = (bottomBuilder != null) ? containerHeight + expandHeight : containerHeight;
    return SizedBox(
    height: height,
    child: ListView.separated(
      padding: padding,
      scrollDirection: Axis.horizontal,
      itemCount: containerCount,
      separatorBuilder: (_, i) => SizedBox(width: i != containerCount-1 ? 24 : 0),
      itemBuilder: (context, index) => (bottomBuilder != null) ? SizedBox(
        width: containerWidth,
        child: FutureBuilder<T>(
          future: future(index),
          builder: (context, snapshot) => 
          (snapshot.connectionState == ConnectionState.done) ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildContainer(context, index),
              bottomBuilder(context, index),
            ],
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(
                height: height - 48 - 6,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: 6),
              Skeleton(
                height: 48,
                width: double.infinity,
                borderRadius: BorderRadius.circular(6),
                style: SkeletonStyle.text,
              ),
            ],
          ),
        ),
      ) : buildContainer(context, index)
    )
  );
  }
}