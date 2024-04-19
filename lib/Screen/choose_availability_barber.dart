import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fademasterz/Modal/booking_summary_argument_modal.dart';
import 'package:fademasterz/Modal/choose_availiabilty_modal.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:fademasterz/Utils/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Utils/app_fonts.dart';
import '../../Utils/app_string.dart';
import '../ApiService/api_service.dart';
import '../Modal/select_specialist_modal.dart';
import '../Utils/app_assets.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';
import 'booking_summary_screen.dart';

class ChooseAvailabilityBarber extends StatefulWidget {
  final String? price;

  const ChooseAvailabilityBarber({super.key, this.price});

  @override
  State<ChooseAvailabilityBarber> createState() =>
      _ChooseAvailabilityBarberState();
}

class _ChooseAvailabilityBarberState extends State<ChooseAvailabilityBarber> {
  int selectIndex = 0;
  int timeSelectIndex = 0;

  TextEditingController noteCn = TextEditingController();
  String _selectedDate = '';
  int? specialist_id;
  var specialist;

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = args.value.toString();
      //_selectDateApi(context);
      _chooseAvailabilityApi(context);
    });
  }

  final picker = ImagePicker();
  File? _imageFile;
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _chooseAvailabilityApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.availabilityBarber,
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfDateRangePicker(
                //    view: DateRangePickerView.month,
                onSubmit: (p0) => _onSelectionChanged,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
                backgroundColor: AppColor.black,
                enablePastDates: false,
                initialDisplayDate: DateTime.now(),
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  dayFormat: 'EEE',
                  weekNumberStyle: DateRangePickerWeekNumberStyle(
                    textStyle: AppFonts.appText,
                  ),
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: AppFonts.normalText,
                  ),
                ),
                monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: AppFonts.normalText,
                    todayTextStyle: AppFonts.appText,
                    weekendTextStyle: AppFonts.yellowFont,
                    blackoutDatesDecoration: const BoxDecoration(),
                    leadingDatesTextStyle: AppFonts.normalText,
                    disabledDatesTextStyle:
                        AppFonts.normalText.copyWith(color: AppColor.gray),
                    trailingDatesTextStyle: AppFonts.appText),
                showNavigationArrow: true,
                yearCellStyle: const DateRangePickerYearCellStyle(
                  disabledDatesTextStyle: AppFonts.appText,
                  leadingDatesTextStyle: AppFonts.appText,
                ),
                todayHighlightColor: AppColor.yellow,
                headerStyle: const DateRangePickerHeaderStyle(
                  backgroundColor: AppColor.yellow,
                  textStyle: AppFonts.blackFont,
                ),
                selectionColor: AppColor.yellow,
                initialSelectedDate: DateTime.now(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 10),
                      child: Text(
                        AppStrings.chooseYourSpecialists,
                        style: AppFonts.regular.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: Visibility(
                        visible: (chooseAvailabilityResponse
                                .data?.availableSpecialist?.isNotEmpty ??
                            false),
                        replacement: Center(
                          child: Text(
                            'No Specialist Found',
                            style: AppFonts.appText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: (chooseAvailabilityResponse
                                  .data?.availableSpecialist?.length ??
                              0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          itemBuilder: (BuildContext context, int index) {
                            specialist = chooseAvailabilityResponse
                                .data?.availableSpecialist?[index];
                            return InkWell(
                              onTap: () async {
                                selectIndex = index;

                                specialist_id = (specialist?.id);

                                await _selectSpecialistTimeApi(context);

                                setState(
                                  () {},
                                );
                              },
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        //  clipBehavior: Clip.antiAlias,
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 3,
                                            color: selectIndex == index
                                                ? AppColor.yellow
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            ApiService.imageUrl +
                                                (specialist?.image ?? ''),
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        (specialist?.name ?? ''),
                                        style: AppFonts.yellowFont.copyWith(
                                          color: selectIndex == index
                                              ? null
                                              : AppColor.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.black,
                ),
                padding: const EdgeInsets.only(bottom: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 9),
                      child: Text(
                        AppStrings.availableTime,
                        style: AppFonts.regular.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Visibility(
                        visible: (chooseAvailabilityResponse
                                .data?.slots?.isNotEmpty ??
                            false),
                        replacement: Center(
                          child: Text(
                            'No TimeSlot Found',
                            style: AppFonts.appText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (selectSpecialistTimeResponse.data?.length ?? 0),
                          addSemanticIndexes: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var timeSlot =
                                selectSpecialistTimeResponse.data?[index];
                            return InkWell(
                              onTap: () {
                                timeSelectIndex = index;

                                setState(
                                  () {},
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: timeSelectIndex == index
                                      ? AppColor.yellow
                                      : Colors.transparent,
                                  border: Border.all(color: AppColor.yellow),
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                //  margin: const EdgeInsets.all(5),
                                child: Text((timeSlot?.time ?? ''),
                                    style: AppFonts.yellowFont.copyWith(
                                        color: timeSelectIndex == index
                                            ? AppColor.black1
                                            : null)),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.desiredLook,
                          style: AppFonts.regular.copyWith(fontSize: 16),
                        ),
                        const Spacer(),
                        const Text(
                          AppStrings.optional,
                          style: AppFonts.yellowFont,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 106,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: AppColor.yellow,
                        dashPattern: const [5, 2],
                        strokeWidth: 2,
                        radius: const Radius.circular(5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  showOptions();
                                },
                                child: SvgPicture.asset(AppIcon.cameraIcon1),
                              ),
                              const Text(
                                AppStrings.uploadImage,
                                style: AppFonts.yellowFont,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.note,
                          style: AppFonts.regular.copyWith(fontSize: 16),
                        ),
                        const Spacer(),
                        const Text(
                          AppStrings.optional,
                          style: AppFonts.yellowFont,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    CustomTextField(
                      controller: noteCn,
                      hintText: 'Write a message !',
                      maxLines: 4,
                      textInputAction: TextInputAction.done,
                      fillColor: const Color(0xff333333),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ElevatedButton(
          onPressed: () {
            int specialistId = (chooseAvailabilityResponse
                    .data?.availableSpecialist?[selectIndex].id ??
                specialist?.id);
            String? time =
                selectSpecialistTimeResponse.data?[timeSelectIndex].time;
            String date = DateFormat('yyyy-MM-dd')
                .format(
                  DateTime.parse(
                    _selectedDate.isNotEmpty
                        ? _selectedDate.toString()
                        : DateTime.now().toString(),
                  ),
                )
                .toLowerCase();
            String text = noteCn.text;
            String? image = _imageFile?.path.toString();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingSummaryScreen(
                    data: BookingSummaryArgument(
                  time: time,
                  date: date,
                  price: widget.price,
                  notetext: noteCn.text,
                  specialistId: specialistId,
                  image: image,
                )),
              ),
            );

            // debugPrint('>>>>>>>>>>>>>>${widget.price}<<<<<<<<<<<<<<');
            // debugPrint('>>>>>>>>>>>>>>${specialistId}<<<<<<<<<<<<<<');
            // debugPrint('>>>>>>>>>>>>>>${date}<<<<<<<<<<<<<<');
            // debugPrint('>>>>>>>>>>>>>>${time}<<<<<<<<<<<<<<');

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookingSummaryScreen(
            //         // time: time,
            //         // date: date,
            //         // // image: image,
            //         // price: widget.price,
            //         // text: text,
            //         // specialistId: specialistId,
            //         ),
            //   ),
            // );
            noteCn.clear();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
            backgroundColor: AppColor.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Text(
                '\$${widget.price}',
                style: AppFonts.blackFont,
              ),
              const Spacer(),
              const Text(
                AppStrings.Continue,
                style: AppFonts.blackFont,
              ),
              const SizedBox(
                width: 7,
              ),
              SvgPicture.asset(AppIcon.forward1Icon)
            ],
          ),
        ),
      ),
    );
  }

  ChooseAvailabilityResponse chooseAvailabilityResponse =
      ChooseAvailabilityResponse();

  Future<void> _chooseAvailabilityApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      if (context.mounted) {
        Utility.progressLoadingDialog(context, true);
      }
      var request = {};
      request["shop_id"] = sharedPreferences.getInt('shop_id');
      request["selected_date"] = DateFormat('yyyy-MM-dd')
          .format(
            DateTime.parse(
              _selectedDate.isNotEmpty
                  ? _selectedDate.toString()
                  : DateTime.now().toString(),
            ),
          )
          .toLowerCase();
      request["selected_day"] = DateFormat('EEEE')
          .format(
            DateTime.parse(
              _selectedDate.isNotEmpty
                  ? _selectedDate.toString()
                  : DateTime.now().toString(),
            ),
          )
          .toLowerCase();

      var response = await http.post(
          Uri.parse(
            ApiService.chooseAvailability,
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
        chooseAvailabilityResponse =
            ChooseAvailabilityResponse.fromJson(jsonResponse);
        if (chooseAvailabilityResponse.data?.availableSpecialist?.isNotEmpty ??
            false) {
          _selectSpecialistTimeApi(context);
        }
        setState(() {});
      }
    } catch (e) {
      Helper().showToast(e.toString());
    }
  }

  SelectSpecialistTimeResponse selectSpecialistTimeResponse =
      SelectSpecialistTimeResponse();
  Future<void> _selectSpecialistTimeApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};

    request["shop_id"] = sharedPreferences.getInt('shop_id');
    request["specialist_id"] = (chooseAvailabilityResponse
            .data?.availableSpecialist?[selectIndex].id ??
        specialist_id); // sharedPreferences.getInt('specialist_id');
    request["selected_date"] = DateFormat('yyyy-MM-dd')
        .format(
          DateTime.parse(
            _selectedDate.isNotEmpty
                ? _selectedDate.toString()
                : DateTime.now().toString(),
          ),
        )
        .toLowerCase();

    var response = await http.post(
        Uri.parse(
          ApiService.selectSpecialist,
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
      selectSpecialistTimeResponse =
          SelectSpecialistTimeResponse.fromJson(jsonResponse);

      setState(() {});
    }
  }
}
