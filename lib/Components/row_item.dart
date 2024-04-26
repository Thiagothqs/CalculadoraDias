import 'package:flutter/material.dart';
import 'package:CalculadoraDias/Locale/strings_enum.dart';
import 'package:CalculadoraDias/Locale/locale.dart';

class RowItem extends StatelessWidget {
  final Strings title;
  final String? subtitle;
  final IconData icon;

  RowItem(this.title, this.subtitle, this.icon);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString(title)!,
          style: theme.textTheme.headline6!
              .copyWith(color: theme.hintColor, fontSize: 16),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              icon,
              color: theme.primaryColor,
              size: 20,
            ),
            SizedBox(width: 12),
            Text(
              subtitle!,
              style: theme.textTheme.headline6!.copyWith(fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
