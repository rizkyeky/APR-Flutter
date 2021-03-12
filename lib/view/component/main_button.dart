part of 'component.dart';

// class MainButton extends StatelessWidget {

//   final String label;
//   final TextStyle labelStyle;
//   final Color color;
//   final void Function() onPressed;
//   final Widget icon;
//   final ShapeBorder shape;

//   const MainButton({
//     this.label,
//     this.labelStyle,
//     this.color,
//     this.icon,
//     this.onPressed,
//     this.shape,
//   });

//   @override
//   Widget build(BuildContext context) => ElevatedButton(
//     style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.all(color ?? colorScheme['accent2']),
//       padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
//         vertical: 14, horizontal: 32 
//       ),)
//     ),
//     // backgroundColor : color ?? colorScheme['accent2'],
//     // shape: shape ?? RoundedRectangleBorder(
//     //   borderRadius: BorderRadius.circular(10)
//     // ),
//     onPressed: onPressed ?? () {},
//     child: (icon == null) ? Text(label, style: labelStyle ?? textTheme.button.copyWith(
//       color: colorScheme['primary']
//     )) : Wrap(
//       spacing: 24,
//       crossAxisAlignment: WrapCrossAlignment.center,
//       alignment: WrapAlignment.center,
//       children: [
//         Text(label, style: labelStyle ?? textTheme.button.copyWith(
//           color: colorScheme['primary']
//         )),
//         icon,
//       ],
//     ),
//   );
// }

class MainButton extends StatelessWidget {

  final String label;
  final TextStyle labelStyle;
  final Color color;
  final void Function() onPressed;
  final Widget icon;
  final OutlinedBorder shape;

  const MainButton({
    @required this.label,
    this.labelStyle,
    this.color,
    this.icon,
    this.onPressed,
    this.shape,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color ?? colorScheme['accent2'],
      padding: const EdgeInsets.symmetric(
        vertical: 18, horizontal: 32 
      ),
      shape: shape ?? const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      onPrimary: color == colorScheme['primary'] 
        ? colorScheme['accent2'] : colorScheme['primary'],
    ),
    onPressed: onPressed,
    child: Text(label, style: labelStyle ?? textTheme.button.copyWith(
      color: colorScheme['primary'],
    ),)
  );
}