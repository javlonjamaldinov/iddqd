import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:iddqd/demo/onboarding_widgets.dart';
import 'package:iddqd/funcs/calendar_funcs.dart';
import 'package:iddqd/funcs/settings_funcs.dart';
import 'package:iddqd/funcs/welcome_funcs.dart';
import 'package:iddqd/variables/global_varibles.dart';
import 'package:iddqd/variables/my_colors.dart';

class Calendar {
  static Widget mentalStateTextInput(int i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12),
            child: AutoSizeText(
              [
                'Mental state',
                'Physical state',
                'Trigger situation',
                'Ways of solving the problem',
              ][i],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeColors.text,
              ),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: w - 32,
            height: 68,
            padding: const EdgeInsets.fromLTRB(12, 2, 8, 0),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: ThemeColors.textInput,
            ),
            alignment: Alignment.center,
            child: TextField(
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ThemeColors.text,
              ),
              onChanged: (value) async {
                //  renew();
              },
              focusNode: [
                mentalStateFocusNode,
                physicalFocusNode,
                trigerSituationFocusNode,
                waysOfSolvingFocusNode
              ][i],
              controller: [
                mentalStateController,
                physicalController,
                trigerSituationController,
                waysOfSolvingController,
              ][i],
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              // onSubmitted: (value) => context.read<FirstAimBloc>().add(FirstAimEvent.setTempNote(text: controller.text)),

              // keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.only(bottom: 14.0),
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff686464),
                ),
              ),
            ),
          ),
        ],
      );

  static Widget top = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: Row(
      children: [
        const Spacer(),
        AutoSizeText(
          'Calendar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: ThemeColors.text,
          ),
          maxLines: 1,
        ),
        const Spacer(),
      ],
    ),
  );

  static Widget nextButton = GestureDetector(
    onTap: () {
      CalendarFuncs.nextButtonPressed();
    },
    child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: ThemeColors.calendarButtons),
        alignment: Alignment.center,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff007AFF),
        )),
  );

  static Widget previousButton = GestureDetector(
    onTap: () {
      CalendarFuncs.previousButtonPressed();
    },
    child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: ThemeColors.calendarButtons),
        alignment: Alignment.center,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Color(0xff007AFF),
        )),
  );

  static Widget dateLabel(String text) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
        child: AutoSizeText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: ThemeColors.text,
          ),
          maxLines: 1,
        ),
      );

  static Widget weewDayLabel(String text) => Container(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
        alignment: Alignment.center,
        child: AutoSizeText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ThemeColors.text,
          ),
          maxLines: 1,
        ),
      );

  static Widget divider = Container(
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    height: 2,
    color: ThemeColors.calendarDivider,
  );

  static Widget calendarCell(
          int day, bool isToday, bool isPassed, List<int> choosedStates) =>
      GestureDetector(
        onTap: () {
          CalendarFuncs.calendarCellPressed();
        },
        child: day == 0
            ? const SizedBox(
                width: 38,
                height: 38,
              )
            : Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        color: isToday
                            ? const Color(0xff007AFF)
                            : const Color(0x00ffffff),
                      ),
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        day.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              isToday ? MyColors.lightText : ThemeColors.text,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  IgnorePointer(
                      ignoring: true,
                      child: Column(
                        children: [
                          if (isPassed)
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: isToday
                                    ? const Color(0xffffffff)
                                    : const Color(0xff007AFF),
                              ),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: 38,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: [
                                      const Color(0xff7DBBFF),
                                      const Color(0xff00C365),
                                      const Color(0xffFFC700),
                                      const Color(0xffFF0202),
                                    ][choosedStates[0]],
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: [
                                      const Color(0xff7DBBFF),
                                      const Color(0xff00C365),
                                      const Color(0xffFFC700),
                                      const Color(0xffFF0202),
                                    ][choosedStates[1]],
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: [
                                      const Color(0xff7DBBFF),
                                      const Color(0xff00C365),
                                      const Color(0xffFFC700),
                                      const Color(0xffFF0202),
                                    ][choosedStates[2]],
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: [
                                      const Color(0xff7DBBFF),
                                      const Color(0xff00C365),
                                      const Color(0xffFFC700),
                                      const Color(0xffFF0202),
                                    ][choosedStates[3]],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
      );

  static Widget statesBlock = Padding(
    padding: const EdgeInsets.only(left: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'States:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: ThemeColors.text,
          ),
          maxLines: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xff7DBBFF),
                ),
              ),
              const SizedBox(width: 12),
              AutoSizeText(
                'No',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.text,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
        Container(
          width: w - 16,
          height: 1,
          color: ThemeColors.calendarDivider,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xff00C365),
                ),
              ),
              const SizedBox(width: 12),
              AutoSizeText(
                'Light',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.text,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
        Container(
          width: w - 16,
          height: 1,
          color: ThemeColors.calendarDivider,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xffFFC700),
                ),
              ),
              const SizedBox(width: 12),
              AutoSizeText(
                'Medium',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.text,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
        Container(
          width: w - 16,
          height: 1,
          color: ThemeColors.calendarDivider,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xffFF0202),
                ),
              ),
              const SizedBox(width: 12),
              AutoSizeText(
                'Hard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.text,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  static Widget todayStatesBlock(List<int> todayStates) => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Today states:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeColors.text,
              ),
              maxLines: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: [
                        const Color(0xff7DBBFF),
                        const Color(0xff00C365),
                        const Color(0xffFFC700),
                        const Color(0xffFF0202),
                      ][todayStates[0]],
                    ),
                  ),
                  const SizedBox(width: 12),
                  AutoSizeText(
                    ['No', 'Light', 'Medium', 'Hard'][todayStates[0]],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.text,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: AutoSizeText(
                      'Depressed',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.text,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            Container(
              width: w - 16,
              height: 1,
              color: ThemeColors.calendarDivider,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: [
                        const Color(0xff7DBBFF),
                        const Color(0xff00C365),
                        const Color(0xffFFC700),
                        const Color(0xffFF0202),
                      ][todayStates[1]],
                    ),
                  ),
                  const SizedBox(width: 12),
                  AutoSizeText(
                    ['No', 'Light', 'Medium', 'Hard'][todayStates[1]],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.text,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: AutoSizeText(
                      'Manic',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.text,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            Container(
              width: w - 16,
              height: 1,
              color: ThemeColors.calendarDivider,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: [
                        const Color(0xff7DBBFF),
                        const Color(0xff00C365),
                        const Color(0xffFFC700),
                        const Color(0xffFF0202),
                      ][todayStates[2]],
                    ),
                  ),
                  const SizedBox(width: 12),
                  AutoSizeText(
                    ['No', 'Light', 'Medium', 'Hard'][todayStates[2]],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.text,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: AutoSizeText(
                      'Irritable',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.text,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            Container(
              width: w - 16,
              height: 1,
              color: ThemeColors.calendarDivider,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: [
                        const Color(0xff7DBBFF),
                        const Color(0xff00C365),
                        const Color(0xffFFC700),
                        const Color(0xffFF0202),
                      ][todayStates[3]],
                    ),
                  ),
                  const SizedBox(width: 12),
                  AutoSizeText(
                    ['No', 'Light', 'Medium', 'Hard'][todayStates[3]],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.text,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: AutoSizeText(
                      'Anxiety',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.text,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      );

  static Widget addNoteButton = GestureDetector(
    onTap: () => CalendarFuncs.addAnoteButtonPressed(),
    child: Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff007AFF),
      ),
      alignment: Alignment.center,
      child: const Row(
        children: [
          Spacer(),
          Icon(
            Icons.add,
            color: Color(0xffffffff),
            size: 24,
          ),
          SizedBox(width: 6),
          AutoSizeText(
            'Add a note',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: MyColors.lightText,
            ),
            maxLines: 1,
          ),
          Spacer(),
        ],
      ),
    ),
  );

  static Widget topNote0 = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: GestureDetector(
      onTap: () => CalendarFuncs.cancelNotePressed(),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff007AFF),
          ),
          const AutoSizeText(
            'Cancel',
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
            'Note',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ThemeColors.text),
            maxLines: 1,
          ),
          const Spacer(),
          const SizedBox(width: 40),
          GestureDetector(
            onTap: () => CalendarFuncs.addNotePressed(),
            child: const AutoSizeText(
              'Add',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color(0xff007AFF),
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
  );

  static Widget topNote1 = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: GestureDetector(
      onTap: () => CalendarFuncs.backNotePressed(),
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
            'Notes',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ThemeColors.text),
            maxLines: 1,
          ),
          const Spacer(),
          const SizedBox(width: 35),
          Onboarding.changeThemeButton(),
        ],
      ),
    ),
  );

  static Widget topNote2 = Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: GestureDetector(
      onTap: () => CalendarFuncs.cancelNotePressed(),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff007AFF),
          ),
          const AutoSizeText(
            'Cancel',
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
            'Note',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ThemeColors.text),
            maxLines: 1,
          ),
          const Spacer(),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => CalendarFuncs.updateNotePressed(),
            child: const AutoSizeText(
              'Update',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color(0xff007AFF),
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
  );

  static Widget editTheNoteButton = GestureDetector(
    onTap: () => CalendarFuncs.editTheNotePressed(),
    child: Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff007AFF),
      ),
      alignment: Alignment.center,
      child: const AutoSizeText(
        'Edit the note',
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

  static Widget deleteButton = GestureDetector(
    onTap: () => CalendarFuncs.deletePressed(),
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
        'Delete',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xffFF0000),
        ),
        maxLines: 1,
      ),
    ),
  );

  static Widget calendarView = Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: ThemeColors.calendarView),
      child: Column(
        children: [
          Row(
            children: [
              Calendar.previousButton,
              const Spacer(),
              Calendar.dateLabel('3 July'),
              const Spacer(),
              Calendar.nextButton,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Calendar.weewDayLabel('S'),
              Calendar.weewDayLabel('M'),
              Calendar.weewDayLabel('T'),
              Calendar.weewDayLabel('W'),
              Calendar.weewDayLabel('T'),
              Calendar.weewDayLabel('F'),
              Calendar.weewDayLabel('S'),
            ],
          ),
          Calendar.divider,
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Calendar.calendarCell(1, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(2, false, true, [0, 1, 2, 3]),
                Calendar.calendarCell(3, true, false, [0, 1, 2, 3]),
                Calendar.calendarCell(4, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(5, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(6, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(7, false, false, [0, 1, 2, 3]),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Calendar.calendarCell(8, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(9, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(10, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(11, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(12, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(13, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(14, false, false, [0, 1, 2, 3]),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Calendar.calendarCell(15, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(16, false, true, [0, 1, 2, 3]),
                Calendar.calendarCell(17, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(18, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(19, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(20, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(21, false, false, [0, 1, 2, 3]),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Calendar.calendarCell(22, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(23, false, true, [0, 0, 0, 0]),
                Calendar.calendarCell(24, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(25, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(26, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(27, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(28, false, false, [0, 1, 2, 3]),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Calendar.calendarCell(29, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(30, false, true, [0, 1, 2, 3]),
                Calendar.calendarCell(0, true, false, [0, 1, 2, 3]),
                Calendar.calendarCell(0, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(0, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(0, false, false, [0, 1, 2, 3]),
                Calendar.calendarCell(0, false, false, [0, 1, 2, 3]),
              ],
            ),
          ),
        ],
      ));
}
