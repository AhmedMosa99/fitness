import 'dart:convert';
import 'dart:typed_data';

import 'package:fitness/moduls/home/controller/home_controller.dart';
import 'package:fitness/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "أهلا بك استاذ  $nameUser...",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
                SvgPicture.asset('assets/images/logo.svg'),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            BuildSlider(),
            SizedBox(
              height: 18.h,
            ),
            Text(
              ' النشاطات:',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 18.h,
            ),
            SizedBox(
              height: 280.h,
              child: GetBuilder<HomeController>(builder: (logic) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    Uint8List decodedbytes = base64.decode(logic
                        .activitiesModel!.data![index].image!
                        .split(',')
                        .last);
                    return SizedBox(
                      child: InkWell(
                        onTap: () async {
                          await logic.getSubActivities(
                              logic.activitiesModel!.data![index].id!,
                              logic.activitiesModel!.data![index].title!);
                        },
                        child: Container(
                          width: 163.w,
                          height: 245,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.memory(
                                  decodedbytes,
                                  height: 164.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  logic.activitiesModel!.data![index].title!,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Divider(
                                height: 0.h,
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.w, left: 8.w),
                                child: Text(
                                  logic.activitiesModel!.data![index]
                                      .shortDescription!,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                  itemCount: logic.activitiesModel!.data!.length,
                );
              }),
            )
          ]),
        ),
      ),
    );
  }
}
