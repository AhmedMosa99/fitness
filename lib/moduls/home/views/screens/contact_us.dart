import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/themes/light_theme.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.w,
            ),
          ),
          title: Text(
            "contactUs".tr,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: 19.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/call.svg',
                      color: HexaColor.fromHexa('#BDBDBD'),
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "phoneNumber".tr,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: HexaColor.fromHexa('#707070'),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "966374643229",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: HexaColor.fromHexa('#000000'),
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/email.svg',
                      color: HexaColor.fromHexa('#BDBDBD'),
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "email".tr,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: HexaColor.fromHexa('#707070'),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "ahmed@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: HexaColor.fromHexa('#000000'),
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/whatsapp.svg',
                      color: HexaColor.fromHexa('BDBDBD'),
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "whatsApp".tr,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: HexaColor.fromHexa('#707070'),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "99968574123",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: HexaColor.fromHexa('#000000'),
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                Divider(
                  height: 1.h,
                  color: HexaColor.fromHexa('#E0E0E0'),
                ),
                SizedBox(
                  height: 18.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/Path 771.svg',
                            width: 18.w,
                            height: 18.h,
                            color: HexaColor.fromHexa('#BDBDBD'),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "sendNotes".tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: HexaColor.fromHexa('#000000'),
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "sendItToUs".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        color: HexaColor.fromHexa('#707070'),
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: HexaColor.fromHexa('#4F4F4F'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Divider(
                  height: 1.h,
                  color: HexaColor.fromHexa('#E0E0E0'),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'followUsOn'.tr,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 39.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexaColor.fromHexa('#E9F2F4'),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/facebook.svg',
                            width: 10.w,
                            height: 18.h,
                            fit: BoxFit.none,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 39.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexaColor.fromHexa('#E9F2F4'),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/twitter.svg',
                            width: 10.w,
                            height: 18.h,
                            fit: BoxFit.none,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 39.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexaColor.fromHexa('#E9F2F4'),
                          ),
                          child: Image.asset(
                            'assets/images/instagram.png',
                            width: 10.w,
                            height: 18.h,
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
