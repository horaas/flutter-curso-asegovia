import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController? textEditingController;
  final bool isPass;
  final IconData icon;
  final String hint;

  const CustomTextField({super.key, required this.type, required this.icon, required this.hint, this.isPass = false, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), offset: const Offset(0, 5), blurRadius: 5)
        ]
      ),
      child: TextField(
        autocorrect: false,
        keyboardType: type,
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: hint
        ),
      ),
    );
  }
}
