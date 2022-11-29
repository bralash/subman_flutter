// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';

class SubscriptionAdditionItem extends StatelessWidget {
  const SubscriptionAdditionItem({
    super.key, required this.logo, required this.service, required this.serviceColor,
  });

  final String logo, service;
  final Color serviceColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(color: kGreen),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(
              logo,
              width: 30,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              service,
              style: TextStyle(
                color: serviceColor,
                fontFamily: "SFPro",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.add, color: kGreen),
          ],
        ),
      ),
    );
  }
}
