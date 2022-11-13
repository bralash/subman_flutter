// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../auth_service.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final String buttonIcon;
  final VoidCallback loginService;
  const SocialLoginButton(
      {super.key,
      required this.buttonText,
      required this.buttonIcon,
      required this.loginService});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image(
            image: AssetImage(buttonIcon),
          ),
          SizedBox(width: 50),
          GestureDetector(
            onTap: () {
              loginService();
            },
            child: Text(
              'Continue with Google',
              style: TextStyle(
                fontFamily: 'SFPro',
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
