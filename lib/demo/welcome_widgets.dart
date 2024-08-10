


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iddqd/funcs/welcome_funcs.dart';
import 'package:iddqd/variables/my_colors.dart';

class Welcome{

      static Widget infoButtons = Row(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            WelcomeFuncs.privacyPolicyPressed();
          },
          child: Container(
              height: 48,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0x00F5F5F5),
              ),
              child: const AutoSizeText(
                'Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D74ED),
                ),
                maxLines: 1,
              )),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            WelcomeFuncs.termsOfUsePressed();
          },
          child: Container(
              height: 48,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0x00F5F5F5),
              ),
              child: const AutoSizeText(
                'Terms of Use',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D74ED),
                ),
                maxLines: 1,
              )),
        ),
      ),
      
    ],
  );

    static Widget startButton = GestureDetector(
      onTap: () => WelcomeFuncs.startPressed(),
      child: Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: const Color(0xff007AFF),
                  ),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                              'Start',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: MyColors.lightText,
                              ),
                              maxLines: 1,
                            ),
      ),
    );

      static Widget title =  Padding(
        padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: AutoSizeText(
                  'Daily Mood Status',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.text
                  ),
                  maxLines: 1,
                ),
      );

        static Widget title2 = Padding(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: ThemeColors.text),
              const SizedBox(width: 6),
              AutoSizeText(
                        'Tracking your current mental \nstate',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.text,
                        ),
                        maxLines: 2,
                      ),
            ],
          ),
        );

          static Widget image = Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Image.asset(
                      'assets/images/welcome.png',
                      fit: BoxFit.fitWidth,
                    ),
          );
    
}