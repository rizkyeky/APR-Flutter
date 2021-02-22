part of 'component.dart';

class MainButton extends StatelessWidget {

  final String label;
  final TextStyle labelStyle;
  final Color color;
  final void Function() onPressed;
  final Widget icon;
  final ShapeBorder shape;

  const MainButton({
    this.label,
    this.labelStyle,
    this.color,
    this.icon,
    this.onPressed,
    this.shape,
  });

  @override
  Widget build(BuildContext context) => RaisedButton(
    color: color ?? colorScheme['accent2'],
    padding: const EdgeInsets.symmetric(
      vertical: 14, horizontal: 32 
    ),
    onPressed: onPressed ?? () {},
    shape: shape ?? RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    child: (icon == null) ? Text(label, style: labelStyle ?? textTheme.button.copyWith(
      color: colorScheme['primary']
    )) : Wrap(
      spacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Text(label, style: labelStyle ?? textTheme.button.copyWith(
          color: colorScheme['primary']
        )),
        icon,
      ],
    ),
  );
}