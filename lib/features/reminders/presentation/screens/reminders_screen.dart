import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Days of Week
    const daysOfWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title
                KText(
                  maxLines: 3,
                  softWrap: true,
                  text: "What time would you like to mediate?",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.titleColor,
                ),

                const SizedBox(height: 18),

                // Subtitle
                KText(
                  maxLines: 3,
                  softWrap: true,
                  text:
                      "Any time you can choose but We recommend first thing in th morning.",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.subTitleColor,
                ),

                const SizedBox(height: 18),

                // Time Picker
                SizedBox(
                  width: double.maxFinite,
                  height: 240,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: "GoogleSans",
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime.now(),
                      use24hFormat: false,
                      onDateTimeChanged: (DateTime newTime) {
                        debugPrint("Selected time: $newTime");
                      },
                    ),
                  ),
                ),

                // Title
                KText(
                  maxLines: 3,
                  softWrap: true,
                  text: "Which day would you like to mediate?",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.titleColor,
                ),

                const SizedBox(height: 18),

                // Subtitle
                KText(
                  maxLines: 3,
                  softWrap: true,
                  text:
                      "Everyday is best, but we recommend picking at least five.",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.subTitleColor,
                ),

                const SizedBox(height: 18),

                SizedBox(
                  height: 200,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: 0,
                    ),
                    onSelectedItemChanged: (index) {
                      debugPrint("Selected day: ${daysOfWeek[index]}");
                    },
                    children: daysOfWeek
                        .map(
                          (day) => Center(
                            child: Text(
                              day,
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "GoogleSans",
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                const SizedBox(height: 12),

                // Save
                KFilledBtn(
                  btnTitle: "Save",
                  btnBgColor: AppColors.primaryColor,
                  btnTitleColor: AppColors.bgColor,
                  onTap: () {
                    // Bottom Nav
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRouterConstants.bottomNav);
                  },
                  borderRadius: 30,
                  fontSize: 16,
                  btnHeight: 55,
                  btnWidth: double.maxFinite,
                ),

                const SizedBox(height: 8),

                // No Thanks
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {},
                    child: KText(
                      maxLines: 1,
                      softWrap: true,
                      text: "No Thanks",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
