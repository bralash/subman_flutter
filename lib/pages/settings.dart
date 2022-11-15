// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../auth_service.dart';
import '../UI/settings_item.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blue[900],
        ),
        title: const Text(
          'Settings',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SettingsItem(
                      settingsColor: Colors.black87,
                      settingsText: 'Currency',
                    ),
                    SizedBox(height: 20),
                    SettingsItem(
                      settingsColor: Colors.amber,
                      settingsText: 'Archived subscriptions',
                    ),
                    SizedBox(height: 20),
                    SettingsItem(
                      settingsColor: Colors.grey,
                      settingsText: 'Categories',
                    ),
                    SizedBox(height: 20),
                    SettingsItem(
                      settingsColor: Colors.green,
                      settingsText: 'Export as CSV',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                'SECURITY',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SettingsItem(
                  settingsColor: (Colors.red[400])!,
                  settingsText: 'Touch ID',
                ),
              ),
              SizedBox(height: 25),
              Text(
                'SUPPORT',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SettingsItem(
                      settingsColor: Colors.amber.shade400,
                      settingsText: 'Rate app',
                    ),
              ),
              SizedBox(height: 35),
              Center(
                child: GestureDetector(
                  onTap: () {
                    AuthService().signOut();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return LoginPage();
                    //     },
                    //   ),
                    // );
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
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
