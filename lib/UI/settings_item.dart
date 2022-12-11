// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subman/constants.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {super.key,
      required this.settingsColor,
      required this.settingsText,
      required this.border, required this.settingsIcon});

  final String settingsIcon;
  final Color settingsColor;
  final String settingsText;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: border ? EdgeInsets.only(bottom: 12) : EdgeInsets.zero,
      decoration: BoxDecoration(
        border: border
            ? Border(
                bottom: BorderSide(width: 1, color: kLightGrey2),
              )
            : Border(),
      ),
      child: Row(
        children: [
          Container(
            height: 37,
            width: 37,
            decoration: BoxDecoration(
              color: settingsColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(settingsIcon, width: 17,),
          ),
          SizedBox(width: 17),
          Text(
            settingsText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 12,
          ),
        ],
      ),
    );
  }
}
