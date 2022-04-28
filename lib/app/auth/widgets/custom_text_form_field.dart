import 'package:flutter/material.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/extensions.dart';

class CustomTextFormField extends StatefulWidget {
  String label;
  bool isPassword;
  TextInputType inputType;
  TextEditingController controller;
  bool isHidden = false;
  final validator;

  CustomTextFormField({
    Key? key,
    required this.label,
    required this.inputType,
    required this.controller,
    required this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      style: const TextStyle(color: Colors.black, fontSize: 17),
      obscureText: widget.isHidden,
      keyboardType: widget.inputType,
      cursorColor: purpleColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(widget.label),
        labelStyle: const TextStyle(
            color: grey, fontSize: 14, fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: purpleColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: dividerColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: errorColor,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: errorColor,
            width: 1.5,
          ),
        ),
        suffixIcon: widget.isPassword == false
            ? const SizedBox()
            : Icon(
                widget.isHidden == true
                    ? Icons.visibility_off
                    : Icons.remove_red_eye,
                size: 20,
                color: grey,
              ).onTap(() {
                setState(() {
                  widget.isHidden = !widget.isHidden;
                });
              }),
      ),
    );
  }
}
