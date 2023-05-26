import 'package:dio/dio.dart';
import 'package:flutter_app/data/models/tracks/tracks.request.model.dart';
import 'package:flutter_app/data/models/tracks/tracks.response.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/utils/cache_manager.dart';
import '../../route/app_route.dart';
import '../models/login/login.request.model.dart';
import '../models/login/login.response.model.dart';
import '../models/register/register.request.model.dart';
import '../models/register/register.response.model.dart';
import '../models/track/track.response.model.dart';
import '../models/user/user.response.model.dart';

part './user_repository/user.repository.dart';
part './track_repository/track.repository.dart';

final storage = GetStorage();

final dio = Dio(
  BaseOptions(
    baseUrl: dotenv.get('URL_API'),
    headers: {
      "Accept": "application/json",
    },
    contentType: "application/json",
  ),
);

class ApiClient with CacheManager {
  ApiClient() {
    initDioClient();
  }

  void initDioClient() {
    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (storage.hasData("jwt")) {
            var token = getJwt();
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            Get.toNamed(AppRoutes.login);
          }
          return handler.next(error);
        },
      ),
    );
  }

  // routes Api

  // categories
  static const String trackUrl = '/colis';

  // users
  static const String userUrl = '/users';
}
