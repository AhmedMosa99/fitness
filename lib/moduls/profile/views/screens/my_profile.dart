import 'package:fitness/moduls/main/views/screens/login.dart';
import 'package:fitness/moduls/profile/views/screens/privacy_policy.dart';
import 'package:fitness/services/local_data/share_pref.dart';
import 'package:fitness/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../home/controller/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "حسابي",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // InkWell(
              //     onTap: () {
              //       Get.to(MyQr());
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Icon(
              //               Icons.qr_code,
              //               size: 25.w,
              //               color: Theme.of(context).primaryColor,
              //             ),
              //             SizedBox(
              //               width: 18.w,
              //             ),
              //             Text('QR',
              //                 style: TextStyle(
              //                     fontSize: 18.sp,
              //                     fontWeight: FontWeight.w600)),
              //           ],
              //         ),
              //         Icon(Icons.arrow_forward_ios,
              //             size: 18.w, color: Theme.of(context).primaryColor)
              //       ],
              //     )),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Divider(),
              // SizedBox(
              //   height: 10.h,
              // ),
              InkWell(
                  onTap: () {
                    logic.getSubscriptions();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 25.w,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text('الاشتراك',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 18.w, color: Theme.of(context).primaryColor)
                    ],
                  )),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () {
                    Get.to(PrivacyPolicy());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.privacy_tip_rounded,
                            size: 25.w,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text("privacyPolice".tr,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 18.w, color: Theme.of(context).primaryColor)
                    ],
                  )),
              SizedBox(
                height: 15.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () async {
                    Get.offAll(LoginScreen());
                    token = null;
                    await SharePref.init();
                    await SharePref.removeKey('token');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 25.w,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text("تسجيل الخروج".tr,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 18.w, color: Theme.of(context).primaryColor)
                    ],
                  )),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        );
      }),
    );
  }
}
