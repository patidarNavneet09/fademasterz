import 'package:fademasterz/Dashboard/dashboard.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../ApiService/api_service.dart';
import '../Utils/app_assets.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';

class BookingSummaryDetail extends StatefulWidget {
  const BookingSummaryDetail({
    super.key,
  });

  @override
  State<BookingSummaryDetail> createState() => _BookingSummaryDetailState();
}

class _BookingSummaryDetailState extends State<BookingSummaryDetail> {
  willPopScop() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoardScreen(
            selectIndex: 1,
          ),
        ),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
  }

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
          ),
          onPressed: () {
            willPopScop();
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MyBookingScreen(),
            //   ),
            // );
          },
        ),
        title: const Text(
          AppStrings.bookingSummary,
          style: AppFonts.appText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 76,
                      width: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          11,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        ApiService.imageUrl + '',
                        // (bookingDetailResponse.data?.shopImage ?? ''),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.shopName,
                            style: AppFonts.regular.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcon.timerIcon,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '19:00',
                                style: AppFonts.regular.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                AppIcon.calenderIcon,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                DateFormat('dd MMM yyyy').format(
                                  DateTime.now(),
                                ), //  DateTime.now().toString(),
                                style: AppFonts.regular.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$120',
                            style: AppFonts.yellowFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.salonAddress,
                      style: AppFonts.yellowFont,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'Sector 1, near shop, city center 20021',
                      style: AppFonts.regular
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.bookingDate,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          AppStrings.bookingTime,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          AppStrings.specialist,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy').format(
                            DateTime.now(),
                          ),
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          '19:00',
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          'Adam Nilson',
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.services,
                          style: AppFonts.yellowFont.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          AppStrings.hairWash,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          AppStrings.haircut,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          AppStrings.nails,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$20',
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          '\$30',
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          '\$10',
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.subTotal,
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              AppStrings.tax,
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$20',
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              '\$10',
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff434343),
                      height: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.total,
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          '\$50',
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*  const SizedBox(
                height: 121,
              ),*/

              /*     Row(
                children: [
                  Expanded(
                    child: MyAppButton(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DashBoardScreen(selectIndex: 2),
                          ),
                        );
                      },
                      title: AppStrings.chatNow,
                      style: AppFonts.blackFont.copyWith(
                          color: AppColor.bg, fontWeight: FontWeight.w500),
                      height: 50,
                      radius: 6,
                    ),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  Expanded(
                    child: MyAppButton(
                      onPress: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 220,
                              decoration: const BoxDecoration(
                                color: AppColor.bg,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20,
                                  ),
                                  topRight: Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox.shrink(),
                                        Text(
                                          textAlign: TextAlign.center,
                                          AppStrings.alert,
                                          style: AppFonts.redFont,
                                        ),
                                        SizedBox(
                                          height: 21,
                                          width: 21,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.cancel,
                                              color: AppColor.yellow,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      AppStrings.rescheduleBooking,
                                      style: AppFonts.appText,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'You can only Reschedule before 2 hrs of booking time',
                                        style: AppFonts.normalText
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Divider(
                                      color: AppColor.dividerColor,
                                    ),
                                    MyAppButton(
                                      onPress: () {
                                        Navigator.of(context).pop();
                                        // Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const BookingSummaryDetail(),
                                        //     ),
                                        //     (route) => false);
                                      },
                                      title: AppStrings.gotIt,
                                      style: AppFonts.blackFont.copyWith(
                                          color: AppColor.bg,
                                          fontWeight: FontWeight.w500),
                                      radius: 7,
                                      height: 50,
                                      width: 128,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      radius: 6,
                      height: 50,
                      title: AppStrings.reschedule,
                      style: AppFonts.blackFont.copyWith(
                          color: AppColor.bg, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 230,
                          decoration: const BoxDecoration(
                            color: AppColor.bg,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              topRight: Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 21,
                                    width: 21,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: AppColor.yellow,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  AppStrings.cancelBooking,
                                  style: AppFonts.appText,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Are you sure you want to cancel your barber/salon booking?',
                                    style: AppFonts.normalText
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                const Divider(
                                  color: AppColor.dividerColor,
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyAppButton(
                                        onPress: () {
                                          Navigator.pop(context);
                                        },
                                        border: Border.all(
                                            color: AppColor.yellow),
                                        title: AppStrings.no,
                                        style: AppFonts.yellowFont.copyWith(
                                            fontWeight: FontWeight.w500),
                                        height: 50,
                                        color: Colors.transparent,
                                        radius: 6,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 21,
                                    ),
                                    Expanded(
                                      child: MyAppButton(
                                        onPress: () {
                                          showModalBottomSheet(
                                            backgroundColor:
                                                Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 230,
                                                decoration:
                                                    const BoxDecoration(
                                                  color: AppColor.bg,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      20,
                                                    ),
                                                    topRight: Radius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox.shrink(),
                                                          Text(
                                                            textAlign:
                                                                TextAlign
                                                                    .center,
                                                            AppStrings.alert,
                                                            style: AppFonts
                                                                .redFont,
                                                          ),
                                                          SizedBox(
                                                            height: 21,
                                                            width: 21,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  const Icon(
                                                                Icons.cancel,
                                                                color: AppColor
                                                                    .yellow,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      const Text(
                                                        AppStrings
                                                            .cancelBooking,
                                                        style:
                                                            AppFonts.appText,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    35),
                                                        child: Text(
                                                          textAlign: TextAlign
                                                              .center,
                                                          'You can only cancel before 2 hrs of booking time',
                                                          style: AppFonts
                                                              .normalText
                                                              .copyWith(
                                                                  fontSize:
                                                                      15),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 14,
                                                      ),
                                                      const Divider(
                                                        color: AppColor
                                                            .dividerColor,
                                                      ),
                                                      MyAppButton(
                                                        onPress: () {
                                                          Navigator.of(
                                                                  context)
                                                              .pop();
                                                        },
                                                        title:
                                                            AppStrings.gotIt,
                                                        style: AppFonts
                                                            .blackFont
                                                            .copyWith(
                                                                color:
                                                                    AppColor
                                                                        .bg,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                        radius: 7,
                                                        height: 50,
                                                        width: 128,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        radius: 6,
                                        height: 50,
                                        title: AppStrings.yesCancelBooking,
                                        style: AppFonts.blackFont.copyWith(
                                            color: AppColor.bg,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    AppStrings.cancelBooking,
                    style: AppFonts.yellowFont
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ))*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: MyAppButton(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoardScreen(selectIndex: 2),
                        ),
                      );
                    },
                    title: AppStrings.chatNow,
                    style: AppFonts.blackFont.copyWith(
                        color: AppColor.bg, fontWeight: FontWeight.w500),
                    height: 50,
                    radius: 6,
                  ),
                ),
                const SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: MyAppButton(
                    onPress: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 220,
                            decoration: const BoxDecoration(
                              color: AppColor.bg,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  20,
                                ),
                                topRight: Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox.shrink(),
                                      Text(
                                        textAlign: TextAlign.center,
                                        AppStrings.alert,
                                        style: AppFonts.redFont,
                                      ),
                                      SizedBox(
                                        height: 21,
                                        width: 21,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.cancel,
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    AppStrings.rescheduleBooking,
                                    style: AppFonts.appText,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'You can only Reschedule before 2 hrs of booking time',
                                      style: AppFonts.normalText
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Divider(
                                    color: AppColor.dividerColor,
                                  ),
                                  MyAppButton(
                                    onPress: () {
                                      Navigator.of(context).pop();
                                      // Navigator.pushAndRemoveUntil(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           const BookingSummaryDetail(),
                                      //     ),
                                      //     (route) => false);
                                    },
                                    title: AppStrings.gotIt,
                                    style: AppFonts.blackFont.copyWith(
                                        color: AppColor.bg,
                                        fontWeight: FontWeight.w500),
                                    radius: 7,
                                    height: 50,
                                    width: 128,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    radius: 6,
                    height: 50,
                    title: AppStrings.reschedule,
                    style: AppFonts.blackFont.copyWith(
                        color: AppColor.bg, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 230,
                        decoration: const BoxDecoration(
                          color: AppColor.bg,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 21,
                                  width: 21,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.cancel,
                                      color: AppColor.yellow,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                AppStrings.cancelBooking,
                                style: AppFonts.appText,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Are you sure you want to cancel your barber/salon booking?',
                                  style: AppFonts.normalText
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              const Divider(
                                color: AppColor.dividerColor,
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: MyAppButton(
                                      onPress: () {
                                        Navigator.pop(context);
                                      },
                                      border:
                                          Border.all(color: AppColor.yellow),
                                      title: AppStrings.no,
                                      style: AppFonts.yellowFont.copyWith(
                                          fontWeight: FontWeight.w500),
                                      height: 50,
                                      color: Colors.transparent,
                                      radius: 6,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 21,
                                  ),
                                  Expanded(
                                    child: MyAppButton(
                                      onPress: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 230,
                                              decoration: const BoxDecoration(
                                                color: AppColor.bg,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    20,
                                                  ),
                                                  topRight: Radius.circular(
                                                    20,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox.shrink(),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          AppStrings.alert,
                                                          style:
                                                              AppFonts.redFont,
                                                        ),
                                                        SizedBox(
                                                          height: 21,
                                                          width: 21,
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Icon(
                                                              Icons.cancel,
                                                              color: AppColor
                                                                  .yellow,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    const Text(
                                                      AppStrings.cancelBooking,
                                                      style: AppFonts.appText,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 35),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        'You can only cancel before 2 hrs of booking time',
                                                        style: AppFonts
                                                            .normalText
                                                            .copyWith(
                                                                fontSize: 15),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 14,
                                                    ),
                                                    const Divider(
                                                      color:
                                                          AppColor.dividerColor,
                                                    ),
                                                    MyAppButton(
                                                      onPress: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      title: AppStrings.gotIt,
                                                      style: AppFonts.blackFont
                                                          .copyWith(
                                                              color:
                                                                  AppColor.bg,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      radius: 7,
                                                      height: 50,
                                                      width: 128,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      radius: 6,
                                      height: 50,
                                      title: AppStrings.yesCancelBooking,
                                      style: AppFonts.blackFont.copyWith(
                                          color: AppColor.bg,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  AppStrings.cancelBooking,
                  style: AppFonts.yellowFont
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }

/*  BookingDetailResponse bookingDetailResponse = BookingDetailResponse();
  Future<void> bookingDetailApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      if (context.mounted) {
        Utility.progressLoadingDialog(context, true);
      }
      var request = {};

      request["booking_id"] = 1;

      var response = await http.post(
          Uri.parse(
            ApiService.bookingDetail,
          ),
          body: jsonEncode(request),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sharedPreferences.getString("access_Token")}'
          });

      if (context.mounted) {
        Utility.progressLoadingDialog(context, false);
      }

      Map<String, dynamic> jsonResponse = jsonDecode(
        response.body,
      );
      Helper().showToast(
        jsonResponse['message'],
      );
      if (jsonResponse['status'] == true) {
        bookingDetailResponse = BookingDetailResponse.fromJson(jsonResponse);

        setState(() {});
      }
    } catch (e) {
      Helper().showToast(e.toString());
    }
  }*/
}
