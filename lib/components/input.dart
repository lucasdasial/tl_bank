import 'package:flutter/material.dart';

Widget inputText(
    String label, String prefix, TextEditingController c, Function? f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        border: const OutlineInputBorder(),
        prefixText: prefix),
    style: const TextStyle(color: Colors.deepOrange, fontSize: 24),
    onChanged: (value) => {f!(value)},
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}
