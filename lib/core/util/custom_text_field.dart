import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {

  final Function onChanged;
  final Function onSubmitted;
  final Function onIconClicked;
  final TextInputAction textInputAction;
  final String labelText;
  final String initialValue;
  final EdgeInsets margin;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget suffix;
  final Widget prefix;
  final bool enabled;
  final bool expands;
  final int maxLines;
  final int minLines;
  final double height;
  final Color color;
  final double radius;
  final String hint;

  final IconData iconData;

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
    this.expands = false,
    this.maxLines,
    this.minLines,
    this.height,
    this.color,
    this.radius = 10,
    this.onSubmitted, this.hint, this.onIconClicked, this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              enabled: enabled,
              expands: expands,
              maxLines: maxLines,
              minLines: minLines,
              textAlignVertical: TextAlignVertical.top,
              initialValue: initialValue,
              style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: hint,
                labelText: labelText,
                alignLabelWithHint: true,
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(0.0,25,15,0),
                labelStyle: const TextStyle(fontSize: 14),
                prefixIcon: prefix,
                prefixIconConstraints: BoxConstraints(minWidth: 30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 5.0.h,minHeight:1.0.h,minWidth: 10.0.w,maxWidth: 10.0.w),
                suffixIcon: (onIconClicked != null)
                    ?GestureDetector(
                    onTap: onIconClicked,
                    child: Icon(iconData)):null
              ),
            ),
          ),
        ],
      ),
    );
  }
}