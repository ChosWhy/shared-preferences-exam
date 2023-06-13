import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharedprefexample/models/user_model.dart';
import 'package:sharedprefexample/widgets/setting_card.dart';
import '../widgets/active_or_passive_with_animation_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ChangeLoadingStateFull<SettingsPage>
    with SettingsPageTitleUtility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(settings,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
            ),
            SettingCard(
                icon: Icons.notifications_none_outlined,
                text: notification,
                rightChild: ActiveOrPassiveWithAnimation(
                    user: widget.user, title: notification)),
            SettingCard(
                icon: Icons.location_on_outlined,
                text: location,
                rightChild: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 35,
                      color: Colors.redAccent,
                    ))),
            SettingCard(
                icon: Icons.dark_mode_outlined,
                text: darkMode,
                rightChild: ActiveOrPassiveWithAnimation(
                  user: widget.user,
                  title: darkMode,
                )),
            SettingCard(
              icon: Icons.group_rounded,
              text: contactUs,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                bindAccount,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            SettingCard(
                text: google,
                icon: FontAwesomeIcons.google,
                rightChild: ActiveOrPassiveWithAnimation(
                  user: widget.user,
                  title: google,
                ),
                iconColor: Colors.red),
            SettingCard(
              text: facebook,
              icon: Icons.facebook,
              rightChild: ActiveOrPassiveWithAnimation(
                user: widget.user,
                title: facebook,
              ),
              iconColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

mixin SettingsPageTitleUtility {
  final String facebook = "Facebook";
  final String google = "Google";
  final String darkMode = "Dark Mode";
  final String notification = "Notification";
  final String bindAccount = "Bind Account";
  final String contactUs = "Contact Us";
  final String location = "Location";
  final String settings = "Settings";
}


