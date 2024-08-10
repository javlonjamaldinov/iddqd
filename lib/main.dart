import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:iddqd/variables/global_varibles.dart';
import 'package:iddqd/variables/my_colors.dart';
import 'package:iddqd/widgets/test_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runApp(const MainApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return KeyboardDismissOnTap(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          backgroundColor: ThemeColors.background,
          body:
              //  WelcomePage(),
              const TestPage(),
        ),
      ),
    );
  }
}
