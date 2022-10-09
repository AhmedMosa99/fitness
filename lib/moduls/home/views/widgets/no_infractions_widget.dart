import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/themes/light_theme.dart';

class NoInfractionsWidget extends StatelessWidget {
  const NoInfractionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 107.h,
          width: 107.w,
          decoration: BoxDecoration(
            color: HexaColor.fromHexa('#F6F6F6'),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset('assets/images/Vector (8).svg'),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'لا يوجد اإشعارات',
          style:
              TextStyle(fontSize: 20.sp, color: HexaColor.fromHexa('#333333')),
        ),
      ],
    );
  }
}
