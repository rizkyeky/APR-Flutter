part of 'component.dart';

class LoginTextField extends StatelessWidget {

  final String hitText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  const LoginTextField({
    required this.hitText,
    required this.controller,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      style: const TextStyle(
        color: Color(0xFF464646),
        fontWeight: FontWeight.normal,
      ),
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hitText,
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
          gapPadding: 0
        ),
      ),
    );
  }
}