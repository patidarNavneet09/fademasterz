import 'package:dotted_border/dotted_border.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:fademasterz/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Utils/app_fonts.dart';
import '../../Utils/app_string.dart';
import '../Utils/app_assets.dart';
import '../Utils/app_list.dart';
import 'booking_summary_screen.dart';

class ChooseAvailabilityBarber extends StatefulWidget {
  final double? price;
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
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = args.value.toString();
      debugPrint('>>>>>>>>>>>>>>${_selectedDate}<<<<<<<<<<<<<<');
    });
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
            children: [
              SfDateRangePicker(
                view: DateRangePickerView.month,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
                backgroundColor: AppColor.black,
                initialDisplayDate: DateTime.now(),
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  dayFormat: 'EEE',
                  weekNumberStyle: DateRangePickerWeekNumberStyle(
                    textStyle: AppFonts.appText,
                  ),
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: AppFonts.normalText),
                ),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                  textStyle: AppFonts.normalText,
                  cellDecoration: BoxDecoration(),
                  todayTextStyle: AppFonts.appText,
                  weekendTextStyle: AppFonts.yellowFont,
                  blackoutDatesDecoration: BoxDecoration(),
                ),
                showNavigationArrow: true,
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
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: images1.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              selectIndex = index;
                              setState(
                                () {},
                              );
                            },
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 3,
                                          color: selectIndex == index
                                              ? AppColor.yellow
                                              : Colors.transparent,
                                        ),
                                      ),
                                      child: Image.asset(
                                        images1[index],
                                        height: 60,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      name1[index],
                                      style: selectIndex == index
                                          ? AppFonts.yellowFont
                                          : AppFonts.normalText.copyWith(
                                              fontSize: 14,
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
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.black,
                ),
                padding: EdgeInsets.only(bottom: 9),
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
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSelect.length,
                        addSemanticIndexes: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        itemBuilder: (BuildContext context, int index) {
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
                              child: Text(timeSelect[index],
                                  style: timeSelectIndex == index
                                      ? AppFonts.text.copyWith(
                                          color: AppColor.black1, fontSize: 14)
                                      : AppFonts.yellowFont),
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
                        dashPattern: [5, 2],
                        strokeWidth: 2,
                        radius: Radius.circular(5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcon.cameraIcon1),
                              Text(
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
                        Text(
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
                      hintText: 'Write a message |',
                      maxLines: 4,
                      textInputAction: TextInputAction.done,
                      fillColor: const Color(0xff333333),
                    ),
                    // MyTextField.myTextFormField(
                    //     controller: noteCn,
                    //     textInputType: TextInputType.text,
                    //     textInputAction: TextInputAction.done,
                    //     hintText: 'Write a message |',
                    //     maxLines: 4,
                    //     fillColor: Color(0xff333333))
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BookingSummaryScreen(),
              ),
            );
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
                '\$${widget.price?.toStringAsFixed(0)}',
                style: AppFonts.blackFont,
              ),
              const Spacer(),
              Text(
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
}
