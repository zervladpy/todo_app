import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String hint;
  final Icon? icono;
  final TextEditingController controller;
  final Function(String value)? onChange;

  const CampoTexto(
      {super.key,
      required this.hint,
      required this.controller,
      this.icono,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: icono,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Theme.of(context).colorScheme.background,
        filled: true,
      ),
    );
  }
}
