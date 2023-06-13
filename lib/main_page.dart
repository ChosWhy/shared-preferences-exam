import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sharedprefexample/models/user_model.dart';
import 'package:sharedprefexample/pages/error_page.dart';
import 'package:sharedprefexample/pages/home_page.dart';
import 'package:sharedprefexample/pages/profile_page.dart';
import 'package:sharedprefexample/pages/search_page.dart';
import 'package:sharedprefexample/pages/settings_page.dart';
import 'package:sharedprefexample/pages/shopping_card_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.user});
  final UserModel user;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final GlobalKey<NavigatorState> _navigatorKey;

  @override
  void initState() {
    super.initState();
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: routeSettings,
      ),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _currentIndex,
        items: const [
          TabItem(icon: Icons.home_outlined),
          TabItem(icon: Icons.search_outlined),
          TabItem(icon: Icons.shopping_basket_outlined),
          TabItem(icon: Icons.person_outline),
        ],
        onTap: (int pageIndex) {
          setState(() {
            _currentIndex = pageIndex;
          });
          _navigateToPage(pageIndex);
        },
      ),
    );
  }

  Route<dynamic>? routeSettings(routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case "/":
        page = const HomePage();
        break;
      case "/homePage":
        page = const HomePage();
        break;
      case "/searchPage":
        page = const SearchPage();
        break;
      case "/shoppingCardPage":
        page = const ShoppingCardPage();
        break;
      case "/profilePage":
        page = ProfilePage(user: widget.user,);
        break;
      case "/settingsPage":
        page = SettingsPage(user: widget.user,);
        break;
      default:
        page = const ErrorPage();
    }
    return MaterialPageRoute(builder: (context) => page);
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed("/homePage");
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed("/searchPage");
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed("/shoppingCardPage");
        break;
      case 3:
        _navigatorKey.currentState?.pushReplacementNamed("/profilePage");
        break;
    }
  }
}

///bunlar okey gibi ardından ben tüm sekmeleri scaffoldsuz tasarlıcam!
