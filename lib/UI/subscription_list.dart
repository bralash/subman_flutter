// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subman/UI/subscription_item.dart';
import 'package:subman/data.dart';

class SubscriptionList extends StatelessWidget {
  const SubscriptionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.grey[500],
            border: OutlineInputBorder(),
            hintText: "Search",
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(width: 0, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // ...List.generate(
        //   subscriptions.length,
        //   (index) => SubscriptionItem(
        //     logo: subscriptions[index]['logo'],
        //     service: subscriptions[index]['service'],
        //     cost: subscriptions[index]['cost'],
        //     color: subscriptions[index]['color'],
        //   ),
        // ),
      ],
    );
  }
}
