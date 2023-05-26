part of '../api_client.dart';

class UserRepository with CacheManager {
  Future<LoginResponseModel?> login(LoginRequestModel model) async {
    var response =
        await dio.post('${ApiClient.userUrl}/login', data: model.toJson());
    if (response.statusCode == 201) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error login');
    }
  }

  Future<RegisterResponseModel?> register(RegisterRequestModel model) async {
    var response =
        await dio.post('${ApiClient.userUrl}/register', data: model.toJson());
    if (response.statusCode == 201) {
      return RegisterResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error register');
    }
  }

  Future<UserResponseModel?> getUser() async {
    var response = await dio.get('${ApiClient.userUrl}/me');
    if (response.statusCode == 200) {
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error get user');
    }
  }

  Future<bool?> removeMyAccount(String? id) async {
    var response = await dio.delete('${ApiClient.userUrl}/$id');
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Error remove user');
    }
  }
}
