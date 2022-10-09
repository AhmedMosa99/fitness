import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyQr extends StatelessWidget {
  const MyQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fitness.png'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25.w,
                        color: Colors.white,
                      ))),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/qr.png',
                  width: 200.w,
                  height: 200.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
