import 'package:fitness/moduls/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاشتراك",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: ListView.separated(
            itemCount: logic.subscriptions!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                width: double.infinity,
                height: 55.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  logic.subscriptions!.data![index].split(':').last +
                      ':' +
                      " " +
                      logic.subscriptions!.data![index].split(':').first,
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 18.h,
              );
            },
          ),
        );
      }),
    );
  }
}
