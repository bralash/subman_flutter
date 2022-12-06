// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subman/constants.dart';
import 'package:intl/intl.dart';
import 'package:subman/pages/subscriptions.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm(
      {super.key,
      required this.logo,
      required this.service,
      required this.serviceColor});

  final String logo, service;
  final Color serviceColor;

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _billDateController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _cycleController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();

  void _saveSubscription() {
    FirebaseFirestore.instance.collection("subscriptions").add({
      "service": widget.service,
      "logo": "assets/logos/${widget.service}.png",
      "serviceColor": widget.serviceColor.value,
      "cost": _costController.text,
      "description": _descriptionController.text,
      "billDate": _billDateController.text,
      "category": _categoryController.text,
      "cycle": _cycleController.text,
      "reminder": _reminderController.text
    });

    _costController.clear();
    _descriptionController.clear();
    _billDateController.clear();
    _categoryController.clear();
    _cycleController.clear();
    _reminderController.clear();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Subscriptions()));
  }

  @override
  void initState() {
    _billDateController.text = "";
    super.initState();
  }

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
            onPressed: () {
              _saveSubscription();
            },
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
                controller: _costController,
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
                controller: _descriptionController,
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
                controller: _billDateController,
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
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat.yMMMd('en_US').format(pickedDate);

                    setState(() {
                      _billDateController.text = formattedDate;
                    });
                  } else {
                    // print("Date is not selected");
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: _categoryController,
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
                controller: _cycleController,
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
                controller: _reminderController,
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
