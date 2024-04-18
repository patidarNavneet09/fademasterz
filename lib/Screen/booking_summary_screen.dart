import 'dart:convert';

import 'package:fademasterz/Modal/book_now_modal.dart';
import 'package:fademasterz/Modal/booking_summary_modal.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiService/api_service.dart';
import '../Utils/app_assets.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';

class BookingSummaryScreen extends StatefulWidget {
  final String? price, time, date, text;
  final String? image;
  final int? specialistId;
  const BookingSummaryScreen(
      {super.key,
      this.price,
      this.specialistId,
      this.time,
      this.date,
      this.text,
      this.image});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  @override
  void initState() {
    bookingSummaryApi(context);
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
                    Container(
                      height: 77,
                      width: 76,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            11,
                          ),
                        ),
                      ),
                      child: Visibility(
                        visible:
                            (bookingSummaryResponse.data?.image?.isNotEmpty ??
                                false),
                        child: Image.network(
                          ApiService.imageUrl +
                              (bookingSummaryResponse.data?.image ?? ''),
                          fit: BoxFit.fill,
                        ),
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
                            (bookingSummaryResponse.data?.name ?? ''),
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
                                (bookingSummaryResponse.data?.bookingTime ??
                                    ''),
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
                                widget.date.toString(),
                                // DateFormat('dd MMM yyyy').format(
                                //   DateTime.parse(
                                //     bookingSummaryResponse.data?.bookingDate
                                //             .toString() ??
                                //         '',
                                //   ),
                                //  ), //  DateTime.now().toString(),
                                style: AppFonts.regular.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$ ${bookingSummaryResponse.data?.subTotal ?? ' '}',
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
                    const Text(
                      AppStrings.salonAddress,
                      style: AppFonts.yellowFont,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      (bookingSummaryResponse.data?.address ?? ''),
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
                          widget.date.toString(),
                          // DateFormat('dd MMM yyyy').format(
                          //   DateTime.parse(
                          //     bookingSummaryResponse.data?.bookingDate
                          //             .toString() ??
                          //         '',
                          //   ),
                          // ),
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          (bookingSummaryResponse.data?.bookingTime ?? ''),
                          style: AppFonts.regular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          (bookingSummaryResponse.data?.specialist?.name ?? ''),
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
                  itemCount: bookingSummaryResponse.data?.services?.length,
                  itemBuilder: (context, index) {
                    var service = bookingSummaryResponse.data?.services?[index];
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
                              (service?.name ?? ''),
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
                              (bookingSummaryResponse.data?.subTotal ?? ''),
                              style: AppFonts.regular.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              (bookingSummaryResponse.data?.tax ?? ''),
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
                          (bookingSummaryResponse.data?.total ?? ''),
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
          bookNowApi(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const PaymentDirection(),
          //   ),
          // );
        },
      ),
    );
  }

  BookingSummaryResponse bookingSummaryResponse = BookingSummaryResponse();

  Future<void> bookingSummaryApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};

    request["shop_id"] = sharedPreferences.getInt('shop_id');
    request["specialist_id"] = widget.specialistId;
    request["time"] = widget.time;
    request["price"] = widget.price;
    request["service_ids"] = '1,3';
    request["date"] = widget.date;

    HttpWithMiddleware http = HttpWithMiddleware.build(
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ],
    );

    var response = await http.post(
        Uri.parse(
          ApiService.bookingSummary,
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
      bookingSummaryResponse = BookingSummaryResponse.fromJson(jsonResponse);

      setState(() {});
    }
  }

  BookNowResponse bookNowResponse = BookNowResponse();

  Future<void> bookNowApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString("access_Token")}'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.bookNow));
    debugPrint('>>>>>>>>>>>>>>${widget.date}<<<<<<<<<<<<<<');
    debugPrint('>>>>>>>>>>>>>>${widget.image}<<<<<<<<<<<<<<');
    request.fields.addAll({
      'shop_id': sharedPreferences.getInt('shop_id').toString(),
      'date': widget.date.toString(),
      'time': widget.time.toString(),
      'sub_total': '330',
      'tax': '82.5',
      'total': '412.5',
      'specialist_id': widget.specialistId.toString(),
      'service_ids': '1,3',
      'note': widget.text.toString(),
    });
    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //       'desired_look', (widget.image.toString() ?? '')),
    // );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    setState(
      () {},
    );
    var result = await response.stream.bytesToString();

    var jsonResponse = jsonDecode(result);

    Helper().showToast(
      jsonResponse["message"],
    );

    if (context.mounted) {
      Utility.progressLoadingDialog(
        context,
        false,
      );
    }
    if (jsonResponse["status"] == true) {
      bookingSummaryResponse = BookingSummaryResponse.fromJson(jsonResponse);
      setState(() {});
    }
  }
}
