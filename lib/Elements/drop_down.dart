import 'package:flutter/material.dart';

import '../Utils/style.dart';

class DropDownDesign extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;
  final String? values;
  final bool? isExpanded;

  const DropDownDesign(
      {Key? key,
      this.hintText,
      this.items,
      this.onChanged,
      this.values,
      this.isExpanded})
      : super(key: key);

  @override
  _DropDownDesignState createState() => _DropDownDesignState();
}

class _DropDownDesignState extends State<DropDownDesign> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              // color: blueColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: blueColor)),
          child: Row(
            children: [
              const Icon(Icons.filter_alt_outlined, color: blueColor),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconEnabledColor: Colors.black54,
                    iconDisabledColor: Colors.black26,
                    elevation: 16,
                    isExpanded: widget.isExpanded ?? false,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: blueColor,
                      size: 25,
                    ),
                    items: widget.items,
                    hint: Row(
                      children: [
                        Text(
                          widget.hintText ?? '',
                          style: const TextStyle(color: blueColor),
                        ),
                      ],
                    ),
                    value: widget.values,
                    iconSize: 30.0,
                    onChanged: (value) => widget.onChanged!(value!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
