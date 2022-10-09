import 'package:fitness/moduls/main/views/screens/mainScreen.dart';
import 'package:fitness/utils/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GoToGym extends StatelessWidget {
  const GoToGym({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/pexels-cesar-galeão-3289711.png'))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "يرجى التوجه إلى النادي لدفع رسومالاشتراك والحصول على QR code الخاص بك؟",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "تم",
                    ),
                    onPressed: () {
                      Get.to(MainScreen());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
