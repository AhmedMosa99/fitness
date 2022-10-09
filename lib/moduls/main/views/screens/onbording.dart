import 'package:fitness/moduls/main/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/component/data_onbording.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<UnbordingContent> contents = [
      UnbordingContent(
          title: 'هل تريد الحصول على نظام غذائي صحي؟',
          image: 'assets/images/onbording1.svg',
          discription: ''),
      UnbordingContent(
          title: 'هل تريد الحصول على جدول للتمارين؟',
          image: 'assets/images/onbording2.svg',
          discription: ''),
      UnbordingContent(
          title: "هل تريد الحصول على جسم رياضي؟",
          image: 'assets/images/onbording3.svg',
          discription: ''),
      // UnbordingContent(
      //     title:
      //         "يرجى التوجه إلى النادي لدفع رسومالاشتراك والحصول على QR code الخاص بك؟",
      //     image: 'assets/images/onbording4.svg',
      //     discription: ''),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        contents[i].image,
                        height: 300.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        contents[i].title,
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            currentIndex == 2
                ? SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (c) => LoginScreen()),
                              (route) => false);
                        },
                        child: Text("تم")))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (c) => LoginScreen()),
                                (route) => false);
                          },
                          child: Text(
                            "تخطي",
                            style: TextStyle(fontSize: 18.sp),
                          )),
                      SizedBox(
                        height: 48.h,
                        width: 138.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (currentIndex < 2) {
                              print(currentIndex);
                              ++currentIndex;
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );

                              setState(() {});
                            }
                            setState(() {});
                          },
                          child: Text("التالي"),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: currentIndex == index ? 15.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Theme.of(context).primaryColor
            : const Color(0xffBDBDBD),
      ),
    );
  }
}
