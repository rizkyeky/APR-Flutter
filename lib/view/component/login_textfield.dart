part of 'component.dart';

class LoginTextField extends StatelessWidget {

  final String hitText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  const LoginTextField({
    this.hitText,
    this.controller,
    this.onChanged,
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
      decoration: InputDecoration(
        hintText: hitText,
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}