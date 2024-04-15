import 'dart:convert';

import 'package:fademasterz/Modal/shop_detail_modal.dart';
import 'package:fademasterz/Screen/reviewes_screen.dart';
import 'package:fademasterz/Screen/select_your_service_screen.dart';
import 'package:fademasterz/Screen/services_screen.dart';
import 'package:fademasterz/Screen/specialist_screen.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ApiService/api_service.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';
import 'gallery_screen.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({super.key});

  @override
  State<ShopDetail> createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  int selectIndex = 0;
  int selectIndex1 = 0;
  bool isListVisible = false;

  List<Widget> categories = [];

  @override
  void initState() {
    shopDetail(context);
    categories = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ReadMoreText(
          (shopDetailModal.data?.about ?? ''),
          trimMode: TrimMode.Line,
          trimLines: 3,
          trimLength: 200,
          style: AppFonts.normalText.copyWith(fontSize: 14),
          trimCollapsedText: 'Read more....',
          isExpandable: true,
          moreStyle: AppFonts.yellowFont,
          lessStyle: AppFonts.yellowFont,
          trimExpandedText: ' show less',
        ),
      ),
      Padding(
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
                        builder: (context) => const ServicesScreen1(),
                      ),
                    );
                  },
                  child: const Text(
                    AppStrings.seeAll,
                    style: AppFonts.yellowFont,
                  ),
                )
              ],
            ),
            const Divider(
              color: AppColor.dividerColor,
              height: 25,
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppStrings.gallery,
                  style: AppFonts.regular.copyWith(fontSize: 16),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GalleryScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    AppStrings.seeAll,
                    style: AppFonts.yellowFont,
                  ),
                )
              ],
            ),
            const Divider(
              color: AppColor.dividerColor,
              height: 25,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemCount: galley.length < 9 ? galley.length : 9,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            clipBehavior: Clip.antiAlias,
                            child: Stack(children: [
                              Image.asset(
                                galley[index],
                                //     images[index],

                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                right: 0,
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
                              )
                            ]),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      galley[index],
                      //     images[index],
                      width: 103,
                      height: 88,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Row(
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
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: AppColor.dividerColor,
                    height: 25,
                  ),
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
                ],
              );
            }
          },
        ),
      ),
    ];
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Image.network(
                  ApiService.imageUrl + (shopDetailModal.data?.image ?? ''),
                  fit: BoxFit.fill,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  left: 15,
                  top: MediaQuery.of(context).viewPadding.top,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: AppColor.yellow, shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        AppIcon.backIcon,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text(
                      shopDetailModal.data?.name ?? '',
                      style: AppFonts.regular.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcon.locationIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          shopDetailModal.data?.address ?? '',
                          style: AppFonts.regular.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcon.ratingIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          shopDetailModal.data?.avgRating ?? '',
                          style: AppFonts.regular.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                shopDetailModal.data?.instagramLink ?? ''));
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(AppIcon.instagramIcon),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                AppStrings.instagram,
                                style: AppFonts.regular.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(AppIcon.openNowIcon),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              AppStrings.openNow,
                              style: AppFonts.regular.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(AppIcon.directionIcon),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              AppStrings.direction,
                              style: AppFonts.regular.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Divider(
                      height: 2,
                      color: AppColor.dividerColor,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 21),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.ourSpecialists,
                          style: AppFonts.regular.copyWith(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecialistScreen(),
                              ),
                            );
                            setState(() {});
                          },
                          child: Text(
                            AppStrings.seeAll,
                            style: AppFonts.yellowFont.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 95,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (shopDetailModal.data?.ourSpecialist!.length ?? 0) > 5
                              ? 7
                              : (shopDetailModal.data?.ourSpecialist!.length ??
                                  0),
                      addSemanticIndexes: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      itemBuilder: (BuildContext context, int index) {
                        var specialist =
                            shopDetailModal.data?.ourSpecialist?[index];
                        return GestureDetector(
                          onTap: () {
                            selectIndex = index;
                            setState(
                              () {},
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            //  margin: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    ApiService.imageUrl +
                                        (specialist?.image ?? ''),
                                    height: 60,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  (specialist?.name ?? ''),
                                  style: AppFonts.normalText
                                      .copyWith(fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 33,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: services.length,
                      addSemanticIndexes: true,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            selectIndex1 = index;
                            setState(
                              () {},
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectIndex1 == index
                                  ? AppColor.yellow
                                  : Colors.transparent,
                              border: Border.all(color: AppColor.yellow),
                              borderRadius: BorderRadius.circular(19),
                            ),
                            //  margin: const EdgeInsets.all(5),
                            child: Text(services[index],
                                style: selectIndex1 == index
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
                  const SizedBox(
                    height: 15,
                  ),
                  categories[selectIndex1],
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyAppButton(
        title: AppStrings.bookNow,
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelectYourServices(),
            ),
          );
        },
      ),
    );
  }

  ShopDetailModal shopDetailModal = ShopDetailModal();
  var shop;
  Future<void> shopDetail(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};

    request["shop_id"] = sharedPreferences.getInt('shop_id');

    HttpWithMiddleware http = HttpWithMiddleware.build(
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ],
    );

    var response = await http.post(
        Uri.parse(
          ApiService.shopDetail,
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
      shopDetailModal = ShopDetailModal.fromJson(jsonResponse);
      shop = shopDetailModal;
      setState(() {});
    }
  }
}
