import 'package:flutter/material.dart';
import 'package:sharedprefexample/models/user_model.dart';
import 'package:sharedprefexample/pages/error_page.dart';
import 'package:sharedprefexample/pages/home_page.dart';
import 'package:sharedprefexample/pages/profile_page.dart';
import 'package:sharedprefexample/pages/search_page.dart';
import 'package:sharedprefexample/pages/settings_page.dart';
import 'package:sharedprefexample/pages/shopping_card_page.dart';

import 'main_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  final String _title = "Shared Preference Example";

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel();
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xffededed),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      routes: {
        "/" : (context) => MainPage(user: user),
        "/homePage" : (context) => const HomePage(),
        "/searchPage" : (context) => const SearchPage(),
        "/shoppingCardPage" : (context) => const ShoppingCardPage(),
        "/profilePage" : (context) => ProfilePage(user: user),
        "/settingsPage" :(context) => SettingsPage(user: user),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) =>  const ErrorPage(),),
    );
  }
}
/*

 */

/// sayfalar için linkler:
/// https://assets.materialup.com/uploads/026b5aca-b248-400d-87b2-173b19ec5870/preview.jpg gibi bi tasarım olucak
/// https://assets.materialup.com/uploads/bbbd3690-a72b-4983-b0b4-342110a231ec/preview.png gibi kataloglarına bakabilirsin
/// https://assets.materialup.com/uploads/4b6e8d81-d709-4eea-8f36-2f431b71f548/attachment.png gibi profil ayarları!
/// https://assets.materialup.com/uploads/98b21e05-d70c-4e90-b20e-f923ea908821/preview.jpg gibi dark mode renkleri!
/// https://www.uplabs.com/posts/e-learning-profile-setting gibi light mode renkleri olabilir!