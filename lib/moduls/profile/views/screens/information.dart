import 'package:fitness/moduls/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<MainController>().getInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25.w,
              color: Colors.white,
            )),
        title: Text(
          "المعلومات",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: GetBuilder<MainController>(builder: (logic) {
        return logic.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'الوزن :',
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 165.h,
                        width: 165.w,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -20,
                              child: Image.asset(
                                'assets/images/circle.png',
                                width: 160.w,
                                height: 160.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                                top: 60.h,
                                bottom: 0,
                                right: 70.w,
                                child: Text(
                                    "${logic.informationModel!.data!.weight!}Kg")),
                          ],
                        ),
                      ),
                      Text(
                        'نسبة السكر في الدم :',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 165.h,
                        width: 165.w,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -20,
                              child: Image.asset(
                                'assets/images/circle.png',
                                width: 160.w,
                                height: 160.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                                top: 60.h,
                                bottom: 0,
                                right: 70.w,
                                child: Text(
                                    '${logic.informationModel!.data!.sugarPercentage}')),
                          ],
                        ),
                      ),
                      Text(
                        ' نسبة الدهون في الدم :',
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 165.h,
                        width: 165.w,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -20,
                              child: Image.asset(
                                'assets/images/circle.png',
                                width: 160.w,
                                height: 160.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                                top: 60.h,
                                bottom: 0,
                                right: 70.w,
                                child: Text(
                                    "${logic.informationModel!.data!.fatPercentage}")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
