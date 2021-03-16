import 'package:flutter/material.dart';

class TextBorderInput extends StatelessWidget {
  final String? labelText;
  final double? labelFontSize;
  final String? hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  const TextBorderInput(
      {this.labelText,
      this.labelFontSize,
      this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.keyboardType = TextInputType.text})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: labelFontSize,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
