import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.label,
      this.prefix,
      this.keyboardType,
      this.onChanged,
      this.initialValue,
      this.maxLength,
      this.focusNode,
      this.enabled = true,
      this.errorText,
      this.suffix,
      this.readOnly = false,
      this.controller,
      this.obscureText = false});
  String? hintText;
  Widget? label;
  String? errorText;
  Widget? suffix;
  bool readOnly;
  String? initialValue;
  void Function(String)? onChanged;
  Widget? prefix;
  FocusNode? focusNode;
  bool obscureText;
  int? maxLength;
  bool enabled;
  TextEditingController? controller;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: '$hintText',
        label: label,
        prefix: prefix,
        suffix: suffix,
        errorText: errorText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.grey)),
      ),
    );
  }
}
