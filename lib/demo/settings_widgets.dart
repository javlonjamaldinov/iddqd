import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iddqd/demo/onboarding_widgets.dart';
import 'package:iddqd/funcs/settings_funcs.dart';
import 'package:iddqd/funcs/welcome_funcs.dart';
import 'package:iddqd/variables/my_colors.dart';

class Settings {
  static Widget button(int index) => GestureDetector(
        onTap: () {
          if (index == 0) {
            SettingsFuncs.privacyPolicyPressed();
          } else if (index == 1) {
            SettingsFuncs.termsOfUsePressed();
          }
          if (index == 2) {
            SettingsFuncs.freeAddsPressed();
          }
          if (index == 3) {
            SettingsFuncs.notificationPressed();
          }
        },
        child: Container(
          height: 80,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0x00007AFF),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              AutoSizeText(
                [
                  'Privacy policy',
                  'Terms of use',
                  'Free Adds',
                  'Notification',
                ][index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.settingsText,
                ),
                maxLines: 1,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.settingsText,
              )
            ],
          ),
        ),
      );

  static Widget notificationSwitcher(bool isNotification) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 8),
        child: Row(
          children: [
            AutoSizeText(
              isNotification ? 'On' : 'Off',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: ThemeColors.settingsText,
              ),
              maxLines: 1,
            ),
            const Spacer(),
            CupertinoSwitch(
                value: isNotification,
                onChanged: (v) => SettingsFuncs.switchPressed(v))
          ],
        ),
      );

  static Widget top = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: GestureDetector(
      onTap: () => SettingsFuncs.backButtonPressed(),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff007AFF),
          ),
          const AutoSizeText(
            'Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xff007AFF),
            ),
            maxLines: 1,
          ),
          const Spacer(),
          AutoSizeText(
            'Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ThemeColors.text),
            maxLines: 1,
          ),
          const Spacer(),
          const SizedBox(width: 40),
          Onboarding.changeThemeButton(),
        ],
      ),
    ),
  );
}
