import 'package:flutter/material.dart';

class TextFielFormValidator_dWidget extends StatelessWidget {
  TextFielFormValidator_dWidget({
    required this.onChanged,
    required this.textInside,
  });
  final String textInside;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: textInside,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 196, 188, 188)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
