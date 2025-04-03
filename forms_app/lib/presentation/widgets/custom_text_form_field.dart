import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final TextInputType? type;
  final String? errorMessage;
  final bool isSecure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.type,
    this.isSecure = false,
    this.errorMessage,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    var border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        keyboardType: type ?? TextInputType.text,
        obscureText: isSecure,
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: border,
          border: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colors.primary),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red),
          ),
          filled: true,
          label: labelText != null ? Text(labelText!) : null,
          isDense: true,
          errorText: errorMessage,
        ),
      ),
    );
  }
}
