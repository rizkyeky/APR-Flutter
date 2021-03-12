part of 'component.dart';

class MainTextField extends StatelessWidget {

  final String hint;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final void Function(String) onChanged;
  final void Function() onTap;
  final bool enabled;
  final Widget suffix;



  const MainTextField({
    this.hint,
    this.contentPadding,
    this.onChanged,
    this.onTap,
    this.suffix,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController();
    final textFieldFocusNode = FocusNode();

    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      
      focusNode: textFieldFocusNode,
      style: const TextStyle(
        color: Color(0xFF464646),
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        enabled: enabled,
        hintText: hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal
        ),
        filled: true,
        fillColor: colorScheme['background2'],
        suffixIcon: suffix,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}