// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subman/data.dart';

import '../UI/subscription_addition_item.dart';

class AddSubscription extends StatefulWidget {
  const AddSubscription({super.key});

  @override
  State<AddSubscription> createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blue[900],
          size: 16,
        ),
        title: const Text(
          'Add Subscription',
          style: TextStyle(
            fontFamily: 'SFPro',
            color: Colors.black87,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
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
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ...List.generate(
              subscriptions.length,
              (index) => SubscriptionAdditionItem(
                logo: addSubscriptions[index]['logo'],
                service: addSubscriptions[index]['service'],
                serviceColor: addSubscriptions[index]['color'],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
