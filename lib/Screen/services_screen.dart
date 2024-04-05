import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_list.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/app_fonts.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppStrings.services,
                  style: AppFonts.regular.copyWith(fontSize: 16),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServicesScreen1(),
                      ),
                    );
                  },
                  child: Text(
                    AppStrings.seeAll,
                    style: AppFonts.yellowFont,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: AppColor.dividerColor,
              height: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount:
                  categoryServices.length < 4 ? categoryServices.length : 4,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcon.rightIcon),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        categoryServices[index],
                        style: AppFonts.appText.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServicesScreen1 extends StatefulWidget {
  const ServicesScreen1({super.key});

  @override
  State<ServicesScreen1> createState() => _ServicesScreen1State();
}

class _ServicesScreen1State extends State<ServicesScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.services,
          style: AppFonts.appText,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcon.backIcon,
            height: 12,
            width: 15,
            //     color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            // onCallback();
            setState(() {});
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: categoryServices.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcon.rightIcon),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          categoryServices[index],
                          style: AppFonts.appText.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
