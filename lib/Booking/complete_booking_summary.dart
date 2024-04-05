import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:fademasterz/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Utils/app_assets.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';

class CompleteBookingDetail extends StatefulWidget {
  const CompleteBookingDetail({super.key});

  @override
  State<CompleteBookingDetail> createState() => _CompleteBookingDetailState();
}

class _CompleteBookingDetailState extends State<CompleteBookingDetail> {
  TextEditingController reviewCn = TextEditingController();

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
            Navigator.pop(context);
          },
        ),
        title: const Text(
          AppStrings.bookingSummary,
          style: AppFonts.appText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
        title: AppStrings.rateNow,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    17,
                  ),
                ),
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              child: SvgPicture.asset(AppIcon.cancelIcon),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            AppStrings.rating,
                            style: AppFonts.blackFont.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        SvgPicture.asset(
                          AppIcon.ratingDialogIcon,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            'You have done using Barber/Salon Service ',
                            style: AppFonts.blackFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Please leave your review so others people can know your opinion.',
                            style: AppFonts.text.copyWith(
                              color: Color(0xff5F5F5F).withOpacity(.90),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15, bottom: 15),
                          child: CustomTextField(
                            controller: reviewCn,
                            textInputAction: TextInputAction.done,
                            radius: 6,
                            hintText: AppStrings.reviews,
                            maxLines: 4,
                            style: AppFonts.blackFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            borderSide: BorderSide.none,
                            isFilled: true,
                            fillColor: Color(0xffEDEDED),
                          ),
                        ),
                        MyAppButton(
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          height: 48,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          title: AppStrings.submit,
                          style: AppFonts.blackFont
                              .copyWith(fontWeight: FontWeight.w500),
                          radius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
