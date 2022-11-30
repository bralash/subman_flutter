// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subman/constants.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm(
      {super.key, required this.logo, required this.service, required this.serviceColor});

  final String logo, service;
  final Color serviceColor;

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: kDarkBlue,
          size: 16,
        ),
        backgroundColor: kWhite,
        title: const Text(
          'Add Subscription',
          style: TextStyle(
            fontFamily: 'SFPro',
            color: kBlack,
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(
                fontFamily: "SFPro",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kDarkBlue,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.logo,
                    width: 45,
                  ),
                  SizedBox(width: 12),
                  Text(
                    widget.service,
                    style: TextStyle(
                        color: widget.serviceColor,
                        fontFamily: "SFPro",
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(),
                  hintText: "Cost",
                  hintStyle: TextStyle(color: kDarkGrey),
                  fillColor: kLightGrey,
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
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(),
                  hintText: "Description",
                  hintStyle: TextStyle(color: kDarkGrey),
                  fillColor: kLightGrey,
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
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_month),
                  hintText: "Bill date",
                  hintStyle: TextStyle(color: kDarkGrey),
                  fillColor: kLightGrey,
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
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.circle),
                  hintText: "No category",
                  hintStyle: TextStyle(color: kDarkGrey),
                  fillColor: kLightGrey,
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
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.sync),
                  hintText: "Cycle",
                  hintStyle: TextStyle(color: kDarkGrey),
                  fillColor: kLightGrey,
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
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notifications_outlined),
                  hintText: "Reminder",
                  hintStyle: TextStyle(color: kDarkGrey),
                  fillColor: kLightGrey,
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
            ],
          ),
        ),
      ),
    );
  }
}
