import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../Utils/app_fonts.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_bar.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppIcon.ratingIcon,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '4.8 (3,2005 reviews)',
                  //AppStrings.gallery,
                  style: AppFonts.regular.copyWith(fontSize: 16),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewsScreen1(),
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
            const Divider(
              color: AppColor.dividerColor,
            ),
            Row(
              children: [
                Text(
                  'Adam New',
                  style: AppFonts.regular.copyWith(fontSize: 15),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.yellow,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.ratingIcon,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '4',
                        style: AppFonts.yellowFont,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Vehicula vitae et senectus curabitur. Et facilisis diam vestibulum vel nibh massa lacus in morbi.',
              style: AppFonts.normalText.copyWith(fontSize: 14),
            ),
            Text(
              DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString(),
              style: AppFonts.normalText
                  .copyWith(fontSize: 13, color: Color(0xff989898)),
            ),
            const Divider(
              color: AppColor.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsScreen1 extends StatefulWidget {
  const ReviewsScreen1({super.key});

  @override
  State<ReviewsScreen1> createState() => _ReviewsScreen1State();
}

class _ReviewsScreen1State extends State<ReviewsScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.reviews,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Adam New',
                        style: AppFonts.regular.copyWith(fontSize: 15),
                      ),
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColor.yellow,
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcon.ratingIcon,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '4',
                              style: AppFonts.yellowFont,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Vehicula vitae et senectus curabitur. Et facilisis diam vestibulum vel nibh massa lacus in morbi.',
                    style: AppFonts.normalText.copyWith(fontSize: 14),
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(DateTime.now()).toString(),
                    style: AppFonts.normalText
                        .copyWith(fontSize: 13, color: Color(0xff989898)),
                  ),
                  const Divider(
                    color: AppColor.dividerColor,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
