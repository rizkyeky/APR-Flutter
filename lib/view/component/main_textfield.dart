part of 'component.dart';

class MainTextField extends StatelessWidget {

  final String hint;
  final Widget suffixIcon;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final void Function(String) onChanged;
  final void Function() onTap;
  final bool enabled;
  final FocusNode focusNode;

  const MainTextField({
    this.hint,
    this.suffixIcon,
    this.contentPadding,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      onChanged: onChanged,
      onTap: onTap,
      focusNode: focusNode,
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
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}