import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final Function onChanged;
  final TextInputAction textInputAction;
  final String labelText;
  final String initialValue;
  final EdgeInsets margin;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget suffix;
  final Widget prefix;
  final bool enabled;
  const CustomTextField({Key key,
    this.onChanged,
    this.textInputAction,
    this.labelText,
    this.margin = const EdgeInsets.symmetric(vertical: 10),
    this.keyboardType,
    this.controller,
    this.suffix,
    this.prefix,
    this.initialValue,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        enabled: enabled,
        initialValue: initialValue,
        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          labelText: labelText,
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(0.0,25,15,0),
          labelStyle: const TextStyle(fontSize: 14),
          suffixIcon: suffix,
          prefixIcon: prefix,
          prefixIconConstraints: BoxConstraints(minWidth: 30),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
          ),

        ),
      ),
    );
  }
}
