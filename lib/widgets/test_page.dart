import 'package:flutter/material.dart';
import 'package:iddqd/demo/calendar_widgets.dart';
import 'package:iddqd/demo/main_widgets.dart';
import 'package:iddqd/demo/onboarding_widgets.dart';
import 'package:iddqd/demo/premium_widgets.dart';
import 'package:iddqd/demo/settings_widgets.dart';
import 'package:iddqd/demo/welcome_widgets.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Calendar.mentalStateTextInput(0),
          Calendar.mentalStateTextInput(1),
          Calendar.mentalStateTextInput(2),
          Calendar.mentalStateTextInput(3),
          Calendar.deleteButton,
          Calendar.editTheNoteButton,
          Calendar.topNote0,
          Calendar.topNote1,
          Calendar.topNote2,
          Calendar.calendarView,
          Calendar.addNoteButton,
          Calendar.statesBlock,
          Calendar.todayStatesBlock([0, 0, 0, 0]),
          Calendar.todayStatesBlock([0, 2, 3, 1]),
          Calendar.todayStatesBlock([3, 2, 1, 0]),
          const Divider(),
          Premium.image,
          Premium.restoreButton,
          Premium.startButton,
          Premium.title,
          Premium.top,
          const Divider(),
          Main.dateLabel('3 July'),
          Main.image(0),
          Main.image(1),
          Main.image(2),
          Main.image(3),
          Main.checkIcon,
          Main.finishTestLabel(),
          Main.indicator(0),
          Main.indicatorLabel(0),
          Main.indicator(1),
          Main.indicatorLabel(1),
          Main.indicator(2),
          Main.indicatorLabel(2),
          Main.indicator(3),
          Main.indicatorLabel(3),
          Main.startButton,
          Main.startLabel,
          Main.testButton(0),
          Main.testButton(1),
          Main.testButton(2),
          Main.testButton(3),
          Main.testLabel(0),
          Main.testLabel(1),
          Main.testLabel(2),
          Main.testLabel(3),
          const Divider(),
          Welcome.infoButtons,
          Welcome.startButton,
          Welcome.title,
          Welcome.title2,
          Welcome.image,
          const Divider(),
          Onboarding.title(0),
          Onboarding.title(1),
          Onboarding.title(2),
          Onboarding.skipButton(),
          Onboarding.changeThemeButton(),
          Onboarding.dots(0),
          Onboarding.dots(1),
          Onboarding.dots(2),
          Onboarding.image(0),
          Onboarding.image(1),
          Onboarding.image(2),
          Onboarding.nextButton(0),
          Onboarding.nextButton(1),
          Onboarding.nextButton(2),
          const Divider(),
          Settings.top,
          Settings.button(0),
          Settings.button(1),
          Settings.button(2),
          Settings.button(3),
          Settings.notificationSwitcher(false),
        ],
      ),
    );
  }
}
