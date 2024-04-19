import 'dart:convert';

import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:fademasterz/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiService/api_service.dart';
import '../Modal/booking_detail_modal.dart';
import '../Utils/app_assets.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';

class CompleteBookingDetail extends StatefulWidget {
  final int? bookingId;
  const CompleteBookingDetail({super.key, this.bookingId});

  @override
  State<CompleteBookingDetail> createState() => _CompleteBookingDetailState();
}

class _CompleteBookingDetailState extends State<CompleteBookingDetail> {
  TextEditingController reviewCn = TextEditingController();
  String? rating1 = '';
  @override
  void initState() {
    bookingDetailApi(context);
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
                        ApiService.imageUrl +
                            (bookingDetailResponse.data?.shopImage ?? ''),
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
                            (bookingDetailResponse.data?.shopName ?? ''),
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
                                (bookingDetailResponse.data?.startTime ?? ''),
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
                                // (bookingDetailResponse.data?.date != null)
                                //     ?
                                DateFormat('dd MMM yyyy').format(
                                  DateTime.parse(
                                    (bookingDetailResponse.data?.date
                                            .toString() ??
                                        ''),
                                  ),
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
                            '\$${(bookingDetailResponse.data?.total ?? '')}',
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
                      (bookingDetailResponse.data?.shopAddress ?? ''),
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
                            DateTime.parse(
                              (bookingDetailResponse.data?.date.toString() ??
                                  ''),
                            ),
                          ),
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          (bookingDetailResponse.data?.startTime ?? ''),
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          (bookingDetailResponse.data?.specialistName ?? ''),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bookingDetailResponse.data?.services?.length,
                  itemBuilder: (context, index) {
                    var service = bookingDetailResponse.data?.services?[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          const Text(
                            AppStrings.services,
                            style: AppFonts.yellowFont,
                          ),
                        Row(
                          children: [
                            Text(
                              (service?.name ?? ' '),
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              '\$${(service?.price ?? ' ')}',
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
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
                              '\$${bookingDetailResponse.data?.subTotal ?? ''}',
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              '\$${bookingDetailResponse.data?.tax ?? ''}',
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
                          '\$${bookingDetailResponse.data?.total ?? ''}',
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                              color: const Color(0xff5F5F5F).withOpacity(.90),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        RatingBar.builder(
                          initialRating: 1.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: AppColor.yellow),
                          onRatingUpdate: (rating) {
                            rating1 = rating.toString();
                            setState(() {});
                            //  print(rating);
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
                          onPress: () async {
                            await rateNowApi(context);
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

  BookingDetailResponse bookingDetailResponse = BookingDetailResponse();
  Future<void> bookingDetailApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      if (context.mounted) {
        Utility.progressLoadingDialog(context, true);
      }
      var request = {};

      request["booking_id"] = widget.bookingId;

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
  }

  Future<void> rateNowApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      if (context.mounted) {
        Utility.progressLoadingDialog(context, true);
      }
      var request = {};
      debugPrint('>>>>>>>>>>>>>>${rating1.toString()}<<<<<<<<<<<<<<');
      request["booking_id"] = widget.bookingId;
      request["rating"] = rating1.toString();
      request["comment"] = reviewCn.text.toString();

      var response = await http.post(
          Uri.parse(
            ApiService.rateNow,
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
        Navigator.of(context).pop();
        reviewCn.clear();
        setState(() {});
      }
    } catch (e) {
      Helper().showToast(e.toString());
    }
  }
}
