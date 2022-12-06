// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../pages/subscription_form.dart';

// import '../constants.dart';

class SubscriptionAdditionItem extends StatefulWidget {
  const SubscriptionAdditionItem({
    super.key,
    required this.logo,
    required this.service,
    required this.serviceColor,
  });

  final String logo, service;
  final Color serviceColor;

  @override
  State<SubscriptionAdditionItem> createState() =>
      _SubscriptionAdditionItemState();
}

class _SubscriptionAdditionItemState extends State<SubscriptionAdditionItem> {
  void press() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubscriptionForm(logo: widget.logo, service: widget.service, serviceColor: widget.serviceColor,),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(color: widget.serviceColor),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(
              "assets/logos/${widget.logo}.png",
              width: 30,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              widget.service,
              style: TextStyle(
                color: widget.serviceColor,
                fontFamily: "SFPro",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.add, color: widget.serviceColor),
          ],
        ),
      ),
    );
  }
}
