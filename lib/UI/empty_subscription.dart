// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subman/pages/add_subscription.dart';

class EmptySubscription extends StatelessWidget {
  const EmptySubscription({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Its lonely here',
            style: TextStyle(
              fontFamily: 'SFPro',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'Subscriptions you add will show here',
            style: TextStyle(
              fontFamily: 'SFPro',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 40),
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
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 22),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Add subscription',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}