import 'package:flutter/material.dart';
import 'models/profile_option_model.dart';

class ProjectDatas{
  List<UserSettingsModel> profileOptionModelItems = [
    UserSettingsModel(title: "Edit Profile", icon: Icons.person_outline,),
    UserSettingsModel(title: "My Purchases", icon: Icons.library_books_rounded),
    UserSettingsModel(title: "My Wallet", icon: Icons.wallet_outlined),
    UserSettingsModel(title: "Recent Viewed", icon: Icons.timer_outlined),
    UserSettingsModel(title: "Logout", icon: Icons.logout_outlined),
  ];
  static int bottomCurrentIndex = 3;

  static List<bool> defaultSettings = [true,false,false,false];
}

