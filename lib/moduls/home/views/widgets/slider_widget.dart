import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../main/controller/main_controller.dart';

int index = 0;

class BuildSlider extends StatefulWidget {
  const BuildSlider({Key? key}) : super(key: key);

  @override
  State<BuildSlider> createState() => _BuildSliderState();
}

class _BuildSliderState extends State<BuildSlider> {
  List<String> images = [
    'assets/images/banner2.jpeg',
    'assets/images/banner4.jpeg',
    'assets/images/logo.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (logic) {
      return false
          ? SizedBox(
              height: 210,
              child: Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 220.h,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInExpo,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 1.0,
                  initialPage: 0,
                ),
                itemCount: images.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset(
                          images[index],
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DotsIndicator(
                          decorator: DotsDecorator(
                              spacing: EdgeInsets.only(right: 6),
                              activeColor: Colors.white,
                              size: Size.square(6.0),
                              activeSize: Size(13.0, 6.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          dotsCount: images.length,
                          position: index.toDouble(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
            );
    });
  }
}
