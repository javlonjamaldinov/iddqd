import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iddqd/funcs/main_funcs.dart';
import 'package:iddqd/funcs/welcome_funcs.dart';
import 'package:iddqd/variables/global_varibles.dart';
import 'package:iddqd/variables/my_colors.dart';

class Main {
  static Widget dateLabel(String date) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xff007AFF),
            ),
            alignment: Alignment.center,
            child: AutoSizeText(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: MyColors.lightText,
              ),
              maxLines: 1,
            ),
          ),
        ],
      );

  static Widget startButton = GestureDetector(
    onTap: () {
      MainFuncs.startPressed();
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
            color: Color(0xff007AFF),
          ),
          alignment: Alignment.center,
          child: const AutoSizeText(
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
      ],
    ),
  );

  static Widget startLabel = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: AutoSizeText(
      'Take a daily \nmood test',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: ThemeColors.text,
        fontFamily: 'Gilroy 24 Medium',
      ),
      maxLines: 2,
    ),
  );

  static Widget testLabel(int i) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: AutoSizeText(
          [
            'Depressed state',
            'Manic state',
            'Irritable state',
            'Anxiety state',
          ][i],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: ThemeColors.text,
            fontFamily: 'Gilroy 24 Medium',
          ),
          maxLines: 1,
        ),
      );

  static Widget testButton(int index) => GestureDetector(
        onTap: () {
          MainFuncs.testButtonPressed(index);
        },
        child: Container(
          height: 48,
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: [
              const Color(0xff00C365).withOpacity(0.33),
              const Color(0xff007AFF).withOpacity(0.33),
              const Color(0xffFFC700).withOpacity(0.33),
              const Color(0xffFF0000).withOpacity(0.33),
            ][index],
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              AutoSizeText(
                [
                  '😁',
                  '🙂',
                  '😐',
                  '😫',
                ][index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: MyColors.lightText,
                ),
                maxLines: 1,
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                [
                  'No',
                  'Light',
                  'Medium',
                  'Hard',
                ][index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.text),
                maxLines: 1,
              ),
              const Spacer(),
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    color: const Color(0xffffffff),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xff007AFF),
                    )),
              ),
            ],
          ),
        ),
      );

  static Widget indicator(int step) => Container(
        height: 4,
        margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: const Color(0xff787880).withOpacity(0.20),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              flex: [1, 2, 3, 4][step],
              child: Container(
                height: 4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color(0xff007AFF),
                ),
              ),
            ),
            Spacer(
              flex: [4, 3, 2, 1][step],
            )
          ],
        ),
      );

  static Widget indicatorLabel(int step) => AutoSizeText(
        '${step + 1}/4',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ThemeColors.text,
        ),
        maxLines: 1,
      );

  static Widget checkIcon = const Padding(
    padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: Icon(
      Icons.check_circle,
      color: Color(0xff00C365),
      size: 78,
    ),
  );

  static Widget finishTestLabel() => AutoSizeText(
        'Daily test passed!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: ThemeColors.text,
        ),
        maxLines: 1,
      );

  static Widget image(int step) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: Image.asset(
          'assets/images/main$step.png',
          fit: BoxFit.fitWidth,
        ),
      );
}
