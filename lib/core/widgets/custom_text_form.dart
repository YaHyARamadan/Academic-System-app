import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/my_text_style.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({super.key, required this.hint,  this.textEditingController});

  final String hint;
  final TextEditingController? textEditingController;

  @override
  _RegisterFormFieldState createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 14),
      child: TextFormField(
        obscureText:
            widget.hint.toLowerCase() == "password" ? _obscureText : false,
        decoration: InputDecoration(
          hintText: 'Enter Your ${widget.hint} Here',
          hintStyle: MyTextStyle.konkhmer40Size400Weight
              .copyWith(fontSize: 14, color: const Color(0xff11A7A4)),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
          suffixIcon: widget.hint.toLowerCase() == "password"
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff11A7A4),
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Empty Valid';
          }
          return null;
        },
        controller: widget.textEditingController,
      ),
    );
  }
}
