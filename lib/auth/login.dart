// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:subman/UI/social_login_button.dart';
import 'package:subman/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
                      color: Colors.blue[900],
                    ),
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
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 120),
              SocialLoginButton(
                buttonText: 'Continue with Google',
                buttonIcon: 'assets/google.png',
                loginService: AuthService().signInWithGoogle,
              ),
              SizedBox(height: 10),
              SocialLoginButton(
                buttonText: 'Continue with Apple',
                buttonIcon: 'assets/apple.png',
                loginService: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
