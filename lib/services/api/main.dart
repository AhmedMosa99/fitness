import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitness/moduls/home/models/notification_model.dart';
import 'package:fitness/moduls/home/models/sub_activities.dart';
import 'package:fitness/moduls/home/models/user_info.dart';
import 'package:fitness/moduls/profile/models/subscriptions.dart';
import 'package:fitness/services/api/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../moduls/home/models/activites_model.dart';
import '../../moduls/main/models/information.dart';
import '../../shared/constant.dart';

class MainDio {
  static String? baseUrl = 'http://jym.hoyorder.com/api/';
  static Dio? dio;
  static init() {
    dio = ApiDio.createDio();
  }

  static Future<UserInfo?> register(
      String? name,
      String? phone,
      String? password,
      String? age,
      String? weight,
      String? gender,
      XFile image) async {
    final path = '${baseUrl}registerUser';
    UserInfo? user;
    try {
      var url = Uri.parse(path);
      FormData formData = FormData.fromMap({
        "name": name,
        "phone": phone,
        "gender": gender,
        "password": age,
        "age": age,
        "weight": weight,
        "password": password,
        'image': await MultipartFile.fromFile(image.path, filename: image.name)
      });
      print(image.path);
      var response = await Dio().post(path,
          data: formData,
          options: Options(headers: {'contentType': "multipart/form-data"}));
      print(response.data);
      if (response.statusCode! < 400) {
        user = UserInfo.fromJson(response.data);
      } else if (response.statusCode == 422) {
        user = UserInfo.fromJson(response.data);
        print(response.data['message']);
      }
    } catch (e) {
      final z = e as DioError;
      if (z.response?.statusCode == 422) {
        user = UserInfo.fromJson(z.response?.data);
        return user;
      }
    }

    return user;
  }

  static Future<UserInfo?> login(
    String? phone,
    String? password,
  ) async {
    final path = '${baseUrl}login';
    UserInfo? user;
    try {
      var url = Uri.parse(path);
      var response =
          await http.post(url, body: {"phone": phone, "password": password});
      print(response.body);
      if (response.statusCode < 400) {
        user = UserInfo.fromJson(jsonDecode(response.body));
      } else {
        user = UserInfo.fromJson(jsonDecode(response.body));
      }
    } on Exception {
      // TODO
    }
    return user;
  }

  static Future<InformationModel?> getInformation() async {
    final path = '${baseUrl}detailsUser';
    InformationModel? information;
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json"
      });
      if (response.statusCode < 400) {
        information = InformationModel.fromJson(jsonDecode(response.body));
      } else {
        information = InformationModel.fromJson(jsonDecode(response.body));
      }
    } on Exception {
      // TODO
    }
    return information;
  }

  static Future<NotificationModel?> getNotification(int? page) async {
    final path = '${baseUrl}notifications?page=$page';
    NotificationModel? notification;
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json"
      });
      if (response.statusCode < 400) {
        notification = NotificationModel.fromJson(jsonDecode(response.body));
      } else {
        notification = NotificationModel.fromJson(jsonDecode(response.body));
      }
    } on Exception {
      // TODO
    }
    return notification;
  }

  static sendToken() async {
    String? tokenApi = await FirebaseMessaging.instance.getToken();
    print(tokenApi);
    print(token);
    print(Platform.isAndroid ? "Android" : "IOS");
    final path = '${baseUrl}deviceToken';

    final Response request;
    try {
      request = await Dio().post(path,
          data: {
            'token': tokenApi,
            'device': Platform.isAndroid ? "Android" : "IOS",
            'type': Platform.localHostname,
          },
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': "Bearer $token"
          }));
      print(request.data);
    } catch (e) {
      print('exception');
      print(e);
      final z = e as DioError;

      if (z.response?.statusCode == 404) {
        print('404');
      } else {
        print(e);
        print('exception');
        throw Exception();
      }
    }
  }

  static Future<ActivitiesModel?> getActivities() async {
    final path = '${baseUrl}activities';
    ActivitiesModel? activitiesModel;
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json"
      });
      print("${response.body}a");
      if (response.statusCode < 400) {
        activitiesModel = ActivitiesModel.fromJson(jsonDecode(response.body));
      } else {
        activitiesModel = ActivitiesModel.fromJson(jsonDecode(response.body));
      }
    } on Exception {
      // TODO
    }
    return activitiesModel;
  }

  static Future<Subscriptions?> getSubscriptions() async {
    final path = '${baseUrl}subscriptions';
    Subscriptions? subscriptions;
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json"
      });
      print("${response.body}a");
      if (response.statusCode < 400) {
        subscriptions = Subscriptions.fromJson(jsonDecode(response.body));
      } else {
        subscriptions = Subscriptions.fromJson(jsonDecode(response.body));
      }
    } on Exception {
      // TODO
    }
    return subscriptions;
  }

  static Future<SubActivities?> getSubActivities(int id) async {
    final path = '${baseUrl}subActivities/$id';
    SubActivities? subActivities;
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json"
      });
      print("${response.body}a");
      if (response.statusCode < 400) {
        subActivities = SubActivities.fromJson(jsonDecode(response.body));
      } else {
        subActivities = SubActivities.fromJson(jsonDecode(response.body));
      }
    } on Exception {
      // TODO
    }
    return subActivities!;
  }
//
//   static Future<User?> getService() async {
//     print(baseUrl);
//     final path =
//         'https://staging.iu.edu.sa/mobileapis/Services/GetServices?culture=$langApi';
//     final Response request;
//     User? user;
//     try {
//       request = await dio!.get(path,
//           options: Options(headers: {
//             'Accept': 'application/json',
//             'Authorization': "kjhfjkashdfkljashflkasfhdkjhksfd",
//           }));
//       print(request.data);
//       if (request.statusCode! < 400) {
//         user = User.fromJson(request.data);
//       } else {}
//     } on Exception {
//       // TODO
//     }
//     return user;
//   }
//
//   static Future<NewsModel?> getNews(String token) async {
//     print(baseUrl);
//     final path =
//         '${baseUrl}News/GetNews?startIndex=0&pageSize=10&storingExpression=Id';
//     final Response request;
//     NewsModel? newsModel;
//     try {
//       request = await dio!.get(path,
//           options: Options(headers: {
//             'Accept': 'application/json',
//             'Authorization': token,
//           }));
//       print(request.data);
//       if (request.statusCode! < 400) {
//         newsModel = NewsModel.fromJson(request.data);
//       } else {}
//     } on Exception {
//       // TODO
//     }
//     return newsModel;
//   }
//
//   static Future<NewsModel?> getNewsWithoutToken() async {
//     final path =
//         'https://staging.iu.edu.sa/mobileapis/Services/GetNews?startIndex=0&pageSize=10&storingExpression=Id';
//     final Response request;
//     NewsModel? newsModel;
//     try {
//       request = await dio!.get(path,
//           options: Options(headers: {
//             'Accept': 'application/json',
//             'Authorization': 'kjhfjkashdfkljashflkasfhdkjhksfd',
//           }));
//       print(request.data);
//       if (request.statusCode! < 400) {
//         newsModel = NewsModel.fromJson(request.data);
//       } else {}
//     } on Exception {
//       // TODO
//     }
//     return newsModel;
//   }
//
//   static Future<int?> favouriteSer(int id, bool flag) async {
//     final path =
//         'http://staging.iu.edu.sa/mobileapis/Users/SetServiceAlwaysOnTop?iuServiceId=$id&alwaysOnTop=${flag.toString()}';
//     final Response request;
//     print(path);
//     int? newsModel;
//     try {
//       print(token);
//       request = await dio!
//           .get(path, options: Options(headers: {'Authorization': token}));
//       if (request.statusCode! < 400) {
//         newsModel = request.statusCode;
//       } else {}
//     } on Exception {
//       // TODO
//     }
//     return newsModel;
//   }
//
//   static Future<NotificationModel?> getNotification() async {
//     print(baseUrl);
//     final path =
//         '${baseUrl}Events/GetEvents?startIndex=0&pageSize=10&storingExpression=Id?culture=$langApi';
//     final Response request;
//     NotificationModel? notificationModel;
//     try {
//       request = await dio!.get(path,
//           options: Options(headers: {
//             'Accept': 'application/json',
//             'Authorization': "$token",
//           }));
//       print(request.data);
//       if (request.statusCode! < 400) {
//         notificationModel = NotificationModel.fromJson(request.data);
//       } else {}
//     } on Exception {
//       // TODO
//     }
//     return notificationModel;
//   }
// }
}
