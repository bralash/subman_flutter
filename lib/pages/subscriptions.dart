// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subman/UI/subscription_list.dart';
import 'package:subman/UI/empty_subscription.dart';
import './add_subscription.dart';
import './settings.dart';
import '../UI/subscription_item.dart';
import '../data.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Subscriptions',
                    style: TextStyle(
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Settings();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      size: 24,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddSubscription();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      size: 24,
                      color: Colors.blue[900],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
  
              subscriptions.isEmpty ? EmptySubscription() : SubscriptionList(),
            ],
          ),
        ),
      ),
    );
  }
}

