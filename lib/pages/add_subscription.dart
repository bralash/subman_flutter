// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../UI/subscription_addition_item.dart';

class AddSubscription extends StatefulWidget {
  const AddSubscription({super.key});

  @override
  State<AddSubscription> createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  final Stream<QuerySnapshot> _servicesStream = FirebaseFirestore.instance
      .collection('services')
      .orderBy("service", descending: false)
      .snapshots();

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
      body: Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     contentPadding: EdgeInsets.symmetric(vertical: 10),
            //     prefixIcon: Icon(Icons.search),
            //     prefixIconColor: Colors.grey[500],
            //     border: OutlineInputBorder(),
            //     hintText: "Search",
            //     fillColor: Colors.grey[200],
            //     filled: true,
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(width: 0, color: Colors.transparent),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         width: 0,
            //       ),
            //     ),
            //   ),
            // ),
            StreamBuilder<QuerySnapshot>(
              stream: _servicesStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
        
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }
        
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return SubscriptionAdditionItem(
                      logo: data['logo'],
                      service: data['service'],
                      serviceColor: Color(data['color']).withOpacity(1),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
