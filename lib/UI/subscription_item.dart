// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem({
    super.key,
    required this.logo,
    required this.service,
    required this.cost,
    required this.color,
    required this.billDate,
  });

  final String logo, service;
  final Color color;
  final double cost;
  final DateTime billDate;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 14),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/logos/${logo}_alt.png",
            width: 30,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                service,
                style: TextStyle(
                  fontFamily: "SFPro",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Next bill date in ${DateTime(billDate.year, billDate.month + 1, billDate.day).difference(DateTime.now()).inDays} days",
                style: TextStyle(
                  fontFamily: "SFPro",
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 11,
                ),
              )
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              "\$${cost.toStringAsFixed(2)}",
              style: TextStyle(
                  fontFamily: "SFPro",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
