import 'package:fitness/moduls/home/models/notification_model.dart';
import 'package:fitness/services/api/main.dart';
import 'package:fitness/shared/constant.dart';
import 'package:fitness/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../profile/models/subscriptions.dart';
import '../../profile/views/screens/Subscribe.dart';
import '../models/activites_model.dart';
import '../models/sub_activities.dart';
import '../views/screens/table_training.dart';

class HomeController extends GetxController {
  bool isGrid = true;
  ActivitiesModel? activitiesModel;
  String? text;
  SubActivities? subActivities;
  Subscriptions? subscriptions;
  NotificationModel? notification;
  int? count = 1;
  bool pageLoading = false;
  ScrollController scrollController = ScrollController();
  List<Datas> data = [];
  bool isLoading = false;
  changeView(bool grid) {
    isGrid = grid;
    update();
  }

  void pagination() async {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent)) {
      print(notification!.data!.nextPageUrl);
      if (notification != null) {
        if (notification!.data!.nextPageUrl != null) {
          pageLoading = true;
          update();

          count = count! + 1;
          notification = await MainDio.getNotification(count);
          print(notification!.data!.data!.length);

          data = data + notification!.data!.data!;
          pageLoading = false;

          update();
        } else {
          print("noFound");
        }
        update();
      } else {
        print("no");
      }
    }
  }

  getNotification() async {
    notification = await MainDio.getNotification(count);
    data = notification!.data!.data!;
    update();
    print(notification!.data!);
  }

  getActivities() async {
    activitiesModel = await MainDio.getActivities();
    if (activitiesModel!.status != 200) {
      Get.snackbar("عذرا", activitiesModel!.message!,
          backgroundColor: HexaColor.fromHexa('#1C28CB'),
          colorText: Colors.white);
    }
    update();
  }

  getSubscriptions() async {
    subscriptions = await MainDio.getSubscriptions();
    if (subscriptions!.data!.isEmpty) {
      Get.snackbar("عذرا", "عليك دفع رسوم الاشتراك",
          backgroundColor: HexaColor.fromHexa('#1C28CB'),
          colorText: Colors.white);
    } else {
      Get.to(SubscribeScreen());
    }
    update();
  }

  getSubActivities(int id, String name) async {
    isLoading = true;
    update();
    subActivities = await MainDio.getSubActivities(id);
    isLoading = false;
    if (subActivities!.status != 200) {
      Get.snackbar("عذرا", subActivities!.message!,
          backgroundColor: HexaColor.fromHexa('#1C28CB'),
          colorText: Colors.white);
    } else {
      Get.to(TableTraining(
        name: name,
      ));
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getActivities();
    scrollController.addListener(pagination);
    if (token != null) {
      getNotification();
    }
  }
}
