part of 'component.dart';

class SnackFlashBar extends StatelessWidget {

  final FlashController controller;
  final FlashPosition position;
  final Color backgroundColor;
  final String contentMessage;
  final TextStyle contentMessageStyle;
  final String actionMessage;
  final TextStyle actionMessageStyle;

  const SnackFlashBar({
    this.controller,
    this.backgroundColor,
    this.contentMessage,
    this.contentMessageStyle,
    this.actionMessage,
    this.actionMessageStyle,
    this.position = FlashPosition.bottom,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Flash(
      controller: controller,
      style: FlashStyle.grounded,
      boxShadows: kElevationToShadow[0],
      horizontalDismissDirection: HorizontalDismissDirection.horizontal,
      position: position,
      backgroundColor: backgroundColor ?? theme.snackBarTheme.backgroundColor,
      child: FlashBar(
        message: Text(contentMessage, style: contentMessageStyle ?? theme.snackBarTheme.contentTextStyle,),
        primaryAction: TextButton(
          onPressed: () => controller.dismiss(), 
          child: Text(actionMessage, style: actionMessageStyle,)
        ),
      ),
    );
  }
}