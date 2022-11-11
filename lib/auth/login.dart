// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 34, vertical: 98),
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    width: 45,
                    height: 45,
                  ),
                ],
              ),
              SizedBox(height: 56),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Text(
                'Create an account or sign in by choosing an option below',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[700]),
              ),
              SizedBox(height: 120),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      width: 29,
                      height: 29,
                      child: Image(
                        image: AssetImage('assets/google.png'),
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      width: 29,
                      height: 29,
                      child: Image(
                        image: AssetImage('assets/apple.png'),
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      'Continue with Apple',
                      style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
