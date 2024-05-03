import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_assets.dart';
import '../Utils/app_color.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/custom_app_button.dart';

class RescheduleSummary extends StatefulWidget {
  const RescheduleSummary({super.key});

  @override
  State<RescheduleSummary> createState() => _RescheduleSummaryState();
}

class _RescheduleSummaryState extends State<RescheduleSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcon.backIcon,
            height: 12,
            width: 15,
            //     color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            // onCallback();
          },
        ),
        title: Text(
          AppStrings.rescheduleSummary,
          style: AppFonts.appText,
        ),
      ),
      bottomNavigationBar: MyAppButton(
        title: AppStrings.rescheduleBooking,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {},
      ),
    );
  }
}
