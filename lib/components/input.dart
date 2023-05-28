import 'package:flutter/material.dart';

Widget inputText(
    String label, String prefix, TextEditingController c, Function? f,
    {TextInputType? type =
        const TextInputType.numberWithOptions(decimal: true)}) {
  return TextFormField(
    controller: c,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '$label é obrigatório!';
      }
    },
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        border: const OutlineInputBorder(),
        prefixText: prefix),
    style: const TextStyle(color: Colors.deepOrange, fontSize: 24),
    onChanged: (value) => {f!(value)},
    keyboardType: type,
  );
}
