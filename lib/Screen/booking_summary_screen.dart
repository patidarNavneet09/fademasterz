import 'package:fademasterz/Screen/payment_direction_screen.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Utils/app_assets.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';

class BookingSummaryScreen extends StatefulWidget {
  const BookingSummaryScreen({super.key});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
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
        title: const Text(
          AppStrings.bookingSummary,
          style: AppFonts.appText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                    Image.asset(
                      AppAssets.homeImage,
                      height: 76,
                      width: 77,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyAppButton(
        title: AppStrings.proceedTOPay,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentDirection(),
            ),
          );
        },
      ),
    );
  }
}
