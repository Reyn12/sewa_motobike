import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.icon,
    required this.hint,
    required this.editingController,
    this.obsecure,
    this.enable = true,
    this.onTapBox,
  });
  final String icon;
  final String hint;
  final TextEditingController editingController;
  final bool? obsecure;
  final bool enable;
  final VoidCallback? onTapBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapBox,
      child: TextField(
        controller: editingController,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xff070623),
        ),
        obscureText: obsecure ?? false,
        decoration: InputDecoration(
          enabled: enable,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff070623),
          ),
          fillColor: Color(0xffFFFFFF),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Color(0xff4A1DFF), width: 2),
          ),
          prefixIcon: UnconstrainedBox(
            alignment: Alignment(0.5, 0),
            child: Image.asset(icon, height: 24, width: 24),
          ),
        ),
      ),
    );
  }
}
