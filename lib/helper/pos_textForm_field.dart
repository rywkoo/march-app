import 'package:flutter/material.dart';
import '../enum/pos_textform_field_enum.dart';
import 'style.dart';

class PosTextformField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const PosTextformField({
    super.key,
    this.controller,
    this.label,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Colors.white30,   // ✅ fixed: needed braces
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never, // ✅ label won’t float
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white30,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: StyleColor.black,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
