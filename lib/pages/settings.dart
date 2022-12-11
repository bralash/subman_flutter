// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subman/constants.dart';
import '../auth_service.dart';
import '../UI/settings_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  Future<void> signout() async {
    AuthService().signOut();
    // Navigator.of(context, rootNavigator: true).pop(context);
    Navigator.popUntil(context, ModalRoute.withName("/"));
  }

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
        child: SingleChildScrollView(
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
                        settingsColor: kBlack,
                        settingsText: 'Currency',
                        border: true,
                        settingsIcon: "assets/settings/money.png",
                      ),
                      SizedBox(height: 20),
                      SettingsItem(
                        settingsColor: kDarkAmber,
                        settingsText: 'Archived subscriptions',
                        border: true,
                        settingsIcon: "assets/settings/box.png",
                      ),
                      SizedBox(height: 20),
                      SettingsItem(
                        settingsColor: kDarkGrey,
                        settingsText: 'Categories',
                        border: true,
                        settingsIcon: "assets/settings/categories.png",
                      ),
                      SizedBox(height: 20),
                      SettingsItem(
                        settingsColor: kGreen,
                        settingsText: 'Export as CSV',
                        border: false,
                        settingsIcon: "assets/settings/file.png",
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
                    settingsColor: kRed,
                    settingsText: 'Touch ID',
                    border: false,
                    settingsIcon: "assets/settings/fingerprint.png",
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
                    settingsColor: kLightAmber,
                    settingsText: 'Rate app',
                    border: false,
                    settingsIcon: "assets/settings/star.png",
                  ),
                ),
                SizedBox(height: 35),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      signout();
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
      ),
    );
  }
}
