import 'package:fitness/moduls/home/models/user_info.dart';
import 'package:fitness/moduls/main/models/information.dart';
import 'package:fitness/moduls/profile/views/screens/information.dart';
import 'package:fitness/moduls/profile/views/screens/my_profile.dart';
import 'package:fitness/services/api/main.dart';
import 'package:fitness/services/local_data/share_pref.dart';
import 'package:fitness/shared/process_loading.dart';
import 'package:fitness/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/constant.dart';
import '../../home/views/screens/home_screen.dart';
import '../../home/views/screens/notification_screen.dart';
import '../views/screens/mainScreen.dart';

class MainController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController phoneLogin = TextEditingController();
  TextEditingController age = TextEditingController();
  String sex = "ذكر";
  TextEditingController wight = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  UserInfo? userInfo;
  InformationModel? informationModel;
  bool isLoading = false;
  onItemTapped(int i) {
    selectedIndex = i;
    update();
  }

  List<Widget> screen = const [
    HomeScreen(),
    NotificationScreen(),
    Information(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;
  XFile? _image;
  XFile? get image => _image;
  Future<void> showPicker(context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text('ستديو'.tr),
                    onTap: () async {
                      await _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: Text('كاميرا'),
                  onTap: () async {
                    await _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 350,
        maxWidth: 550);

    _image = image;
    if (_image != null) {}
    update();
  }

  _imgFromGallery() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 350,
        maxWidth: 550);

    _image = image;

    update();
  }

  showSnackBar(String text) {
    Get.snackbar("عذرا", "$text مطلوب ",
        backgroundColor: HexaColor.fromHexa('#1C28CB'),
        colorText: Colors.white);
  }

  register() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      await SharePref.init();
      Get.bottomSheet(ProcessLoading());
      userInfo = await MainDio.register(name.text, phone.text, password.text,
          age.text, wight.text, sex == "ذكر" ? "male" : "female", image!);
      Get.back();
      if (userInfo != null) {
        if (userInfo!.status == 200) {
          await SharePref.setData(key: 'token', data: userInfo!.data!.token!);
          await SharePref.setData(key: 'name', data: userInfo!.data!.name!);
          token = await SharePref.getData(key: 'token');
          nameUser = await SharePref.getData(key: 'name');
          Get.offAll(const MainScreen());
          name.clear();
          phone.clear();
          age.clear();
          password.clear();
          wight.clear();
          sex = "ذكر";
          await MainDio.init();
          await MainDio.sendToken();
        } else {
          Get.snackbar("عذرا", userInfo!.message!,
              backgroundColor: HexaColor.fromHexa('#1C28CB'),
              colorText: Colors.white);
        }
      }
    } else {
      print("false");
    }
  }

  login() async {
    print(!formKeyLogin.currentState!.validate());
    if (formKeyLogin.currentState!.validate()) {
      await SharePref.init();
      Get.bottomSheet(const ProcessLoading());
      print(phoneLogin.text);
      print(passwordLogin.text);
      userInfo = await MainDio.login(phoneLogin.text, passwordLogin.text);
      Get.back();
      if (userInfo!.status == 200) {
        await SharePref.setData(key: 'token', data: userInfo!.data!.token!);
        await SharePref.setData(key: 'name', data: userInfo!.data!.name!);
        token = await SharePref.getData(key: 'token');
        nameUser = await SharePref.getData(key: 'name');
        Get.offAll(const MainScreen());
        phoneLogin.clear();
        name.clear();
        await MainDio.sendToken();
      } else {
        Get.snackbar("عذرا", userInfo!.message!,
            backgroundColor: HexaColor.fromHexa('#1C28CB'),
            colorText: Colors.white);
      }
    }
  }

  getInformation() async {
    isLoading = true;
    informationModel = await MainDio.getInformation();
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    MainDio.init();

    super.onInit();
  }
}
