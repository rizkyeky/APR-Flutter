
part of 'component.dart';

class ContainerImage extends StatelessWidget {

  final ImageProvider? image;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final Widget? child;

  const ContainerImage({
    this.image, 
    this.onTap, 
    this.height, 
    this.width, 
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: colorScheme['primary']?.withOpacity(0.48),
        highlightColor: colorScheme['primary']?.withOpacity(0.24),
        onTap: onTap ?? () {},
        child: Ink.image(
          fit: BoxFit.cover,
          image: image ?? MemoryImage(injector.imagePlaceHolder!),
          child: child
        ),
      ),
    );
  }
}