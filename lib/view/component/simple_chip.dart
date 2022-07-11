part of 'component.dart';

class SimpleChip extends StatelessWidget {

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onTap;

  const SimpleChip({
    this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(24),
            color: color ?? Colors.white
          ),
          child: child,
        ),
      ),
    );
  }
}