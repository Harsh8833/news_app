import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/style.dart';

class EditTextField extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatterData;
  final TextEditingController? controller;
  final String? hint;
  final bool? readOnly;
  final TextInputType? keyBoard;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final int? maxLength;
  final int? maxLines;
  final double? horizontal;
  final double? vertical;
  final int? lengthLimiting;
  final Function? onChanged;
  final Function? onSaved;
  final Function? validator;
  final String? labelText;
  final String? initialValue;
  final Widget? prefixIcon;

  const EditTextField({
    Key? key,
    this.inputFormatterData,
    this.controller,
    this.hint,
    this.readOnly,
    this.keyBoard,
    this.textAlign,
    this.focusNode,
    this.maxLength,
    this.maxLines,
    this.horizontal,
    this.vertical,
    this.lengthLimiting,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.labelText,
    this.initialValue,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          readOnly: widget.readOnly ?? false,
          textAlign: widget.textAlign ?? TextAlign.start,
          cursorColor: primaryColor,
          expands: false,
          focusNode: widget.focusNode,
          validator: (value) =>
              widget.validator != null ? widget.validator!(value) : null,
          inputFormatters: widget.inputFormatterData,
          scrollPadding: EdgeInsets.zero,
          style: const TextStyle(fontSize: 17.0, color: primaryColor),
          controller: widget.controller,
          keyboardType: widget.keyBoard ?? TextInputType.text,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onChanged: (val) =>
              widget.onChanged != null ? widget.onChanged!(val) : null,

          // onSaved: widget.onSaved,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            focusColor: Colors.black,
            hoverColor: Colors.black,
            suffixIcon: widget.prefixIcon,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            // prefixIcon: Text(''),
            contentPadding: EdgeInsets.symmetric(
                vertical: widget.vertical ?? 12.0,
                horizontal: widget.horizontal ?? 15),
            isDense: true,
            labelStyle: labelTextStyle,
            labelText: widget.labelText,
            hintText: widget.hint,
            hintStyle: hintTextStyle,
            filled: true,
            fillColor: primaryColor,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.0)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.0)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.0)),
          ),
        ),
      ],
    );
  }
}

InputDecoration decoration = InputDecoration(
    counterText: "",
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(25)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(25)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(25)));
