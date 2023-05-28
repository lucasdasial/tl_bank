import 'package:flutter/material.dart';

Widget button(String label, Function f) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          f();
        },
        child: Text(label),
      ),
    ),
  );
}
