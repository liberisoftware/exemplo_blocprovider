import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String label;
  final String hint;
  final IconData? icone;

  Editor ({ required this.controlador, required this.label, required this.hint, this.icone });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.00
        ),
        decoration: InputDecoration(
          icon: (icone != null ? Icon(icone) : null ),
          labelText: label,
          hintText: hint
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}