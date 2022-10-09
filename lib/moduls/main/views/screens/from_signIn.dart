import 'dart:io';

import 'package:fitness/moduls/main/controller/main_controller.dart';
import 'package:fitness/moduls/main/views/screens/login.dart';
import 'package:fitness/utils/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class FormBegin extends StatelessWidget {
  const FormBegin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<MainController>(builder: (logic) {
          return SafeArea(
            child: Form(
              key: logic.formKey,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/form1.png'))),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 16.w, left: 16.w, bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "أهلا بك...",
                            style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                              width: 45.w,
                              height: 45.h,
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            logic.image != null
                                ? CircleAvatar(
                                    foregroundColor: Colors.transparent,
                                    backgroundImage:
                                        FileImage(File(logic.image!.path)),
                                    radius: 55.h,
                                  )
                                : CircleAvatar(
                                    foregroundColor: Colors.transparent,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    radius: 55.h,
                                  ),
                            Positioned(
                              bottom: -5.h,
                              child: IconButton(
                                  onPressed: () async {
                                    await logic.showPicker(context);
                                  },
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xffBDBDBD),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'الاسم',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        child: defaultFormField(
                            borderRadius: 8,
                            borderColor: Theme.of(context).primaryColor,
                            controller: logic.name,
                            validate: (v) {
                              if (v!.isEmpty) {
                                logic.showSnackBar('الاسم');
                              }
                            },
                            type: TextInputType.text),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'الرقم',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        child: defaultFormField(
                            borderRadius: 8,
                            borderColor: Theme.of(context).primaryColor,
                            controller: logic.phone,
                            validate: (v) {
                              if (v!.isEmpty) {
                                logic.showSnackBar('الرقم');
                              }
                            },
                            type: TextInputType.phone),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'العمر',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        child: defaultFormField(
                            borderRadius: 8,
                            borderColor: Theme.of(context).primaryColor,
                            controller: logic.age,
                            validate: (v) {
                              if (v!.isEmpty) {
                                logic.showSnackBar('العمر');
                              }
                            },
                            type: TextInputType.number),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'الوزن',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        child: defaultFormField(
                            borderRadius: 8,
                            borderColor: Theme.of(context).primaryColor,
                            controller: logic.wight,
                            validate: (v) {
                              if (v!.isEmpty) {
                                logic.showSnackBar('العمر');
                              }
                            },
                            type: TextInputType.number),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'الجنس',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonHideUnderline(
                          child: GFDropdown(
                            padding: const EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(10),
                            border: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1),
                            dropdownButtonColor: Colors.white,
                            value: logic.sex,
                            onChanged: (newValue) {
                              logic.sex = newValue as String;
                              logic.update();
                            },
                            items: ['ذكر', 'انثى']
                                .map((value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'كلمة المرور',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        child: defaultFormField(
                            borderRadius: 8,
                            borderColor: Theme.of(context).primaryColor,
                            controller: logic.password,
                            validate: (v) {
                              if (v!.isEmpty) {
                                logic.showSnackBar("كلمة المرور ");
                              }
                            },
                            type: TextInputType.text),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 44.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            "تسجيل",
                          ),
                          onPressed: () async {
                            await logic.register();
                            // Get.to(GoToGym());
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(" لدي حساب ؟ "),
                          InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
