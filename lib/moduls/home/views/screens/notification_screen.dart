import 'package:fitness/moduls/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Get.find<HomeController>().getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "notification".tr,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          child: ListView.separated(
            controller: logic.scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                height: 129.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 25.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(logic.data[index].data!.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            logic.data[index].data!.description!,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(logic.data[index].time!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          color: Colors.white, fontSize: 15.sp))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 14.h,
              );
            },
            itemCount: logic.data.length,
          ),
        );
      }),
    );
  }
}
