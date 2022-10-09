import 'package:fitness/moduls/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (logic) {
      return Scaffold(
        body: logic.screen[logic.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: logic.onItemTapped,
          currentIndex: logic.selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined), label: 'الإشعارات'),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information), label: 'المعلومات'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'الحساب',
            ),
          ],
        ),
      );
    });
  }
}
