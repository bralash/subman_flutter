// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subman/UI/subscription_item.dart';
import 'package:subman/UI/empty_subscription.dart';
import 'package:subman/pages/subscription_details.dart';
import './add_subscription.dart';
import './settings.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  final Stream<QuerySnapshot> _subscriptionStream =
      FirebaseFirestore.instance.collection("subscriptions").snapshots();

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
                            return SettingsPage();
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

              StreamBuilder<QuerySnapshot>(
                stream: _subscriptionStream,
                builder: (BuildContext content,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return EmptySubscription();
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }

                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionDetails(
                                  id: document.id,
                                  logo: data['logo'],
                                  service: data['service'],
                                  serviceColor: Color(data['serviceColor'])
                                      .withOpacity(1),
                                  billDate: data['billDate'],
                                  cost: data['cost'],
                                  description: data['description'],
                                  category: data['category'],
                                  reminder: data['reminder'],
                                  cycle: data['cycle'],
                                ),
                              ));
                        },
                        child: SubscriptionItem(
                          logo: data['logo'],
                          service: data['service'],
                          cost: double.parse(data['cost']),
                          color: Color(data['serviceColor']).withOpacity(1),
                          billDate: DateFormat("yMMMd").parse(
                            data['billDate'],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              // subscriptions.isEmpty ? EmptySubscription() : SubscriptionList(),
            ],
          ),
        ),
      ),
    );
  }
}
