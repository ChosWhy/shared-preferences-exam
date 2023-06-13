import 'package:flutter/material.dart';
import 'package:sharedprefexample/managers/shared_manager.dart';
import 'package:sharedprefexample/models/user_model.dart';
import 'package:sharedprefexample/pages/settings_page.dart';

class ActiveOrPassiveWithAnimation extends StatefulWidget {
  const ActiveOrPassiveWithAnimation(
      {Key? key, required this.user, required this.title})
      : super(key: key);
  final UserModel user;
  final String title;

  @override
  State<ActiveOrPassiveWithAnimation> createState() =>
      _ActiveOrPassiveWithAnimationState();
}

class _ActiveOrPassiveWithAnimationState
    extends ChangeLoadingStateFull<ActiveOrPassiveWithAnimation>
    with SettingsPageTitleUtility {
  late bool isActive = false;
  late final SharedManager _sharedManager;

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    _initAlize();
  }

  Future<void> _initAlize() async {
    changeLoading();
    await _sharedManager.init().then((value) => getDefaultValue());
    changeLoading();
  }

  void getDefaultValue() {
    if (_sharedManager.preferences != null) {
      if (widget.title == notification) {
        isActive = _sharedManager.getBool(SharedKeys.notification) ??
            widget.user.notification;
      } else if (widget.title == darkMode) {
        isActive =
            _sharedManager.getBool(SharedKeys.darkMode) ?? widget.user.darkMode;
      } else if (widget.title == google) {
        isActive =
            _sharedManager.getBool(SharedKeys.google) ?? widget.user.google;
      } else if (widget.title == facebook) {
        isActive =
            _sharedManager.getBool(SharedKeys.facebook) ?? widget.user.facebook;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : InkWell(
            onTap: () {
              setState(() {
                isActive = !isActive;
                if (widget.title == notification) {
                  _sharedManager.saveBool(SharedKeys.notification, isActive);
                } else if (widget.title == darkMode) {
                  _sharedManager.saveBool(SharedKeys.darkMode, isActive);
                } else if (widget.title == google) {
                  _sharedManager.saveBool(SharedKeys.google, isActive);
                } else if (widget.title == facebook) {
                  _sharedManager.saveBool(SharedKeys.facebook, isActive);
                }
              });
            },
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: isActive ? Colors.redAccent : Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                alignment:
                    isActive ? Alignment.centerRight : Alignment.centerLeft,
                children: [
                  AnimatedPositioned(
                    left: isActive ? 35 : 5,
                    right: isActive ? 5 : 35,
                    duration: const Duration(milliseconds: 150),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

abstract class ChangeLoadingStateFull<T extends StatefulWidget>
    extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
