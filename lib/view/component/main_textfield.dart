part of 'component.dart';

class MainTextField extends StatelessWidget {

  final String hint;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final void Function(String) onChanged;
  final void Function() onTap;
  final bool enabled;
  final IconData icon;


  const MainTextField({
    this.hint,
    this.contentPadding,
    this.onChanged,
    this.onTap,
    this.icon,
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
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme['primary'],
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(12)),
            ),
            child: Icon(icon),
          ),
        ),
        
        contentPadding: const EdgeInsets.only(left: 15.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}