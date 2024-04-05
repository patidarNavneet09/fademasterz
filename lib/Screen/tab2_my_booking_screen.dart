import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Booking/booking_details.dart';
import '../Booking/complete_booking_summary.dart';
import '../Utils/app_assets.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({
    super.key,
  });

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  bool isVisible = true;
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.myBooking,
          style: AppFonts.appText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      isVisible = true;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                          border: isVisible == true
                              ? null
                              : Border.all(
                                  color: AppColor.gray.withOpacity(
                                    .61,
                                  ),
                                ),
                          color: isVisible == true
                              ? AppColor.yellow
                              : AppColor.black),
                      child: Text(
                        AppStrings.upcoming,
                        style: isVisible == true
                            ? AppFonts.regular.copyWith(
                                fontSize: 15,
                                color: Color(0xff272727),
                              )
                            : AppFonts.regular.copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      isVisible = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                          border: isVisible == false
                              ? null
                              : Border.all(
                                  color: AppColor.gray.withOpacity(
                                    .61,
                                  ),
                                ),
                          color: isVisible == false
                              ? AppColor.yellow
                              : AppColor.black),
                      child: Text(
                        AppStrings.completed,
                        style: isVisible == false
                            ? AppFonts.regular.copyWith(
                                fontSize: 15,
                                color: Color(0xff272727),
                              )
                            : AppFonts.regular.copyWith(
                                fontSize: 15,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Visibility(
                visible: isVisible == true,
                replacement: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(
                          11,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 9),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '# 2304400',
                                  style: AppFonts.yellowFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                SvgPicture.asset(AppIcon.timerIcon),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('15:00', style: AppFonts.yellowFont),
                                const SizedBox(
                                  width: 12,
                                ),
                                SvgPicture.asset(AppIcon.calenderIcon),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    DateFormat('dd MMM yyyy')
                                        .format(DateTime.now()),
                                    style: AppFonts.yellowFont),
                              ],
                            ),
                            Divider(
                              color: AppColor.gray.withOpacity(.49),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.homeImage,
                                  height: 77,
                                  width: 76,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.shopName,
                                        style: AppFonts.regular
                                            .copyWith(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcon.locationIcon,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              'Sector 1, near shop, city center',
                                              style: AppFonts.regular.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$60',
                                        style: AppFonts.yellowFont,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CompleteBookingDetail(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 28,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColor.yellow,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  AppStrings.viewDetails,
                                  style: AppFonts.blackFont.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(
                          11,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 9),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '# 2304400',
                                  style: AppFonts.yellowFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                SvgPicture.asset(AppIcon.timerIcon),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('15:00', style: AppFonts.yellowFont),
                                const SizedBox(
                                  width: 12,
                                ),
                                SvgPicture.asset(AppIcon.calenderIcon),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    DateFormat('dd MMM yyyy')
                                        .format(DateTime.now()),
                                    style: AppFonts.yellowFont),
                              ],
                            ),
                            Divider(
                              color: AppColor.gray.withOpacity(.49),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.homeImage,
                                  height: 77,
                                  width: 76,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.shopName,
                                        style: AppFonts.regular
                                            .copyWith(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcon.locationIcon,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              'Sector 1, near shop, city center',
                                              style: AppFonts.regular.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$60',
                                        style: AppFonts.yellowFont,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BookingSummaryDetail(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 28,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColor.yellow,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  AppStrings.viewDetails,
                                  style: AppFonts.blackFont.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
