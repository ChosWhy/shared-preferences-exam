import 'package:flutter/material.dart';
import 'package:sharedprefexample/managers/navigator_manager.dart';
import 'package:sharedprefexample/project_datas.dart';
import 'package:sharedprefexample/pages/settings_page.dart';
import '../models/user_model.dart';
import '../widgets/profile_another_setting_option_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProjectDatas _datas = ProjectDatas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                NavigatorManager.navigatorPush(
                    context: context, route: SettingsPage(user: widget.user,));
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              //ImageAndNameContainer
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            color: Colors.blue,
                            image: const DecorationImage(
                                image: AssetImage("assets/images/person.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Emily Kim",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //profile edit
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ProfileAnotherSettingOptionWidget(
                          title: _datas.profileOptionModelItems[index].title,
                          icon: _datas.profileOptionModelItems[index].icon),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
