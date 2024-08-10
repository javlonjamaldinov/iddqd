


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iddqd/funcs/onboarding_funcs.dart';
import 'package:iddqd/funcs/welcome_funcs.dart';
import 'package:iddqd/variables/global_varibles.dart';
import 'package:iddqd/variables/my_colors.dart';

class Onboarding{

  static Widget image(int index) => Padding(
    padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: 
    Image.asset(
              'assets/images/onboarding$index.png',
              fit: BoxFit.fitWidth,
            ),
  );

    static Widget title(int index) => Padding(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 8),

      child: AutoSizeText(
                ['Welcome to Daily Mood Status. This is an app for tracking your mental health',
                'Write down and track your emotional state every day by filling out a small questionnaire',
                'Write an anxiety diary to intelligently assess your stress levels',
                ][index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.text,
                  fontFamily: 'Gilroy 24 Medium',
                ),
              ),
    );


  static Widget nextButton(int index) =>  GestureDetector(
    onTap: (){
      OnboardingFuncs.nextPressed();
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: const Color(0xff007AFF),
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                                index > 1 ? 'Finish': 'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.lightText,
                                ),
                                maxLines: 1,
                              ),
        ),
      ],
    ),
  );


    static Widget dots(int index) => IntrinsicWidth(
      child: Container(
                  height: 24,
                  // width: 62,
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: ThemeColors.dotsBloc,
                  ),
                  child: Row(children: [
                    Container(
                                height: 8,
                                width: 8,
                                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: ThemeColors.text.withOpacity(index == 0 ? 1: 0.5)
                                ),
                    ),
                    Container(
                                height: 8,
                                width: 8,
                                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: ThemeColors.text.withOpacity(index == 1 ? 1: 0.5)
                                ),
                    ),
                    Container(
                                height: 8,
                                width: 8,
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: ThemeColors.text.withOpacity(index == 2 ? 1: 0.5)
                                ),
                    ),
                  ],)
      ),
    );

      static Widget skipButton() =>  GestureDetector(
        onTap: (){
          OnboardingFuncs.skipPressed();
        },
        child: Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: const Color(0x00007AFF),
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                                'Skip',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffAEAEAE),
                                ),
                                maxLines: 1,
                              ),
        ),
      );

        static Widget changeThemeButton() =>  GestureDetector(
          onTap: (){
            OnboardingFuncs.changeThemePressed();
          },
          child: Image.asset(
                    'assets/images/theme_change${isDark ? 1:0}.png',
                    fit: BoxFit.fill,
                    height: 24,
                    width: 24,
                  ),
        );
}