import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subman/pages/subscriptions.dart';

import '../constants.dart';

class SubscriptionDetails extends StatefulWidget {
  const SubscriptionDetails(
      {super.key,
      required this.service,
      required this.logo,
      required this.serviceColor,
      required this.billDate,
      required this.cost,
      required this.description,
      required this.category,
      required this.reminder,
      required this.cycle,
      required this.id});

  final String id,
      service,
      logo,
      billDate,
      cost,
      description,
      category,
      reminder,
      cycle;
  final Color serviceColor;

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _billDateController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();
  final TextEditingController _cycleController = TextEditingController();

  @override
  void initState() {
    _costController.text = widget.cost;
    _descriptionController.text = widget.description;
    _billDateController.text = widget.billDate;
    _categoryController.text = widget.category;
    _reminderController.text = widget.reminder;
    _cycleController.text = widget.cycle;
    categoryValue = widget.category;
    cycleValue = widget.cycle;
    reminderValue = widget.reminder;
    super.initState();
  }

  String categoryValue = "Music";
  String cycleValue = "Monthly";
  String reminderValue = "No";

  var categories = ['Education', 'Entertainment', 'Game', 'Lifestyle', 'Productivity', 'Social'];
  var cycle = ["Monthly", 'Annually'];
  var reminder = ["Yes", "No"];

  void _updateSubscription() {
    var collection = FirebaseFirestore.instance.collection("subscriptions");
    collection.doc(widget.id).update({
      "service": widget.service,
      "logo": widget.logo,
      "serviceColor": widget.serviceColor.value,
      "cost": _costController.text.trim(),
      "description": _descriptionController.text.trim(),
      "billDate": _billDateController.text.trim(),
      "category": categoryValue,
      "cycle": cycleValue,
      "reminder": reminderValue
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Subscriptions()));
  }

  Future<void> _deleteSubscription() async {
    final collection = FirebaseFirestore.instance.collection("subscriptions");
    collection.doc(widget.id).delete();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Subscriptions()));
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
        title: Text(
          "Subscription Details",
          style: TextStyle(
            fontFamily: 'SFPro',
            color: kBlack,
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _updateSubscription();
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
        backgroundColor: kWhite,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logos/${widget.logo}.png",
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
              Center(
                child: Text(
                  "Last billed on ${widget.billDate}",
                  style: TextStyle(
                    color: kDarkGrey,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
              DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.circle),
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
                hint: Text(widget.category),
                icon: Icon(Icons.keyboard_arrow_down),
                items: categories.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    categoryValue = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.sync),
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
                hint: Text(widget.cycle),
                icon: Icon(Icons.keyboard_arrow_down),
                items: cycle.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    cycleValue = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notifications),
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
                hint: Text(widget.reminder),
                icon: Icon(Icons.keyboard_arrow_down),
                items: reminder.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    reminderValue = newValue!;
                  });
                },
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: Text("Delete?"),
                        content:
                            Text("Do you want to delete ${widget.service}"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: kBlue),
                            ),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("Cancel");
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text(
                              "Delete",
                              style: TextStyle(color: kRed),
                            ),
                            isDefaultAction: true,
                            onPressed: () {
                              _deleteSubscription();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Delete Subscription'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kRed,
                      padding: EdgeInsets.symmetric(vertical: 17)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
