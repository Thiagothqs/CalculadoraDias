import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final Function? onSuffixPressed;
  final TextCapitalization? textCapitalization;
  final bool showUnderline;
  final IconData? prefixIcon;
  final TextStyle? style;

  EntryField({
    this.controller,
    this.label,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.maxLines,
    this.onSuffixPressed,
    this.textCapitalization,
    this.showUnderline = true,
    this.prefixIcon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (label != null) SizedBox(height: 12),
          if (label != null)
            Text(
              label!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Theme.of(context).hintColor, fontSize: 15),
            ),
          Row(
            children: [
              if (prefixIcon != null)
                Icon(
                  prefixIcon,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              if (prefixIcon != null) SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: style ??
                      Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.sentences,
                  cursorColor: Theme.of(context).primaryColor,
                  autofocus: false,
                  controller: controller,
                  readOnly: readOnly ?? false,
                  keyboardType: keyboardType,
                  minLines: 1,
                  initialValue: initialValue,
                  maxLength: maxLength,
                  maxLines: maxLines ?? 1,
                  decoration: InputDecoration(
                    focusedBorder: showUnderline
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))
                        : InputBorder.none,
                    enabledBorder: showUnderline
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 0.5))
                        : InputBorder.none,
                    hintText: hint,
                    hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    counter: Offstage(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
