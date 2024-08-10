import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iddqd/funcs/premium_funcs.dart';
import 'package:iddqd/funcs/welcome_funcs.dart';
import 'package:iddqd/variables/global_varibles.dart';
import 'package:iddqd/variables/my_colors.dart';

class Premium {
  static Widget image = Container(
    color: const Color(0xffffffff),
    child: Image.asset(
      'assets/images/premium.png',
      fit: BoxFit.fill,
      height: h,
      width: w,
    ),
  );

  static Widget top = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: GestureDetector(
      onTap: () => PremiumFuncs.backButtonPressed(),
      child: const Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Color(0xff007AFF),
          ),
          AutoSizeText(
            'Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xff007AFF),
            ),
            maxLines: 1,
          ),
          Spacer(),
          AutoSizeText(
            'Premium',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: MyColors.darkText),
            maxLines: 1,
          ),
          Spacer(),
          Icon(
            Icons.arrow_back_ios,
            color: Color(0x00007AFF),
          ),
          AutoSizeText(
            'Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0x00007AFF),
            ),
            maxLines: 1,
          ),
        ],
      ),
    ),
  );

  static Widget title = const Padding(
    padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: Column(
      children: [
        AutoSizeText(
          'Adds free \nfor:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: MyColors.darkText,
          ),
          maxLines: 2,
        ),
        AutoSizeText(
          '\$0,49',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: MyColors.darkText,
          ),
          maxLines: 1,
        ),
      ],
    ),
  );

  static Widget startButton = GestureDetector(
    onTap: () => PremiumFuncs.startPressed(),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
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

  static Widget restoreButton = GestureDetector(
    onTap: () => PremiumFuncs.startPressed(),
    child: Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0x00007AFF),
      ),
      alignment: Alignment.center,
      child: const AutoSizeText(
        'Restore',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xff007AFF),
        ),
        maxLines: 1,
      ),
    ),
  );
}
