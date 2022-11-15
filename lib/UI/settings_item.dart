// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final Color settingsColor;
  final String settingsText;

  const SettingsItem({super.key, required this.settingsColor, required this.settingsText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 37,
          width: 37,
          decoration: BoxDecoration(
            color: settingsColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 17),
        Text(
          settingsText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
