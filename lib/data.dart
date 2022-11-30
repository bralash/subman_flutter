// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

List<Map<String, dynamic>> subscriptions = [
  {
    "service": "Spotify",
    "logo": "assets/logos/spotify.png",
    "description": "Payment for monthly premium subscription",
    "color": Color(0xFF42d860),
    "cost": 25.00,
    "billDate": "23-12-2022",
    "category": "Entertainment",
    "cycle": "Monthly",
    "reminder": false,
  },
  {
    "service": "Apple Music",
    "logo": "assets/logos/apple.png",
    "description": "Apple Music Family subscription",
    "color": Color(0xFFed4054),
    "cost": 4.99,
    "billDate": "27-12-2022",
    "category": "Entertainment",
    "cycle": "Monthly",
    "reminder": true,
  },
  {
    "service": "iCloud",
    "logo": "assets/logos/icloud.png",
    "description": "iCloud 200GB subscription",
    "color": Color(0xFF3e82f5),
    "cost": 0.99,
    "billDate": "23-10-2021",
    "category": "Entertainment",
    "cycle": "Monthly",
    "reminder": "none",
  },
  {
    "service": "Netflix",
    "logo": "assets/logos/netflix.png",
    "description": "Payment for monthly premium subscription",
    "color": Color(0xFFe50a14),
    "cost": 12.00,
    "billDate": "23-10-2021",
    "category": "Entertainment",
    "cycle": "Monthly",
    "reminder": "none",
  }, 
];

List<Map<String, dynamic>> addSubscriptions = [
  {
    "service": "Spotify",
    "logo": "assets/logos/spotify_alt.png",
    "description": "Payment for monthly premium subscription",
    "color": Color(0xFF42d860),
  },
  {
    "service": "Apple Music",
    "logo": "assets/logos/apple_alt.png",
    "description": "Apple Music Family subscription",
    "color": Color(0xFFed4054),
  },
  {
    "service": "iCloud",
    "logo": "assets/logos/icloud_alt.png",
    "description": "iCloud 200GB subscription",
    "color": Color(0xFF3e82f5),
  },
  {
    "service": "Netflix",
    "logo": "assets/logos/netflix_alt.png",
    "description": "Payment for monthly premium subscription",
    "color": Color(0xFFe50a14),
  }, 
  {
    "service": "Other",
    "logo": "assets/logos/other.png",
    "description": "Payment for monthly premium subscription",
    "color": Color(0xFF3e82f5),
  }, 
];
