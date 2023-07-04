import 'dart:convert';

import 'package:fakenews2/api/model/requests/RegisterRequest.dart';
import 'package:fakenews2/api/model/response/LoginResponse.dart';
import 'package:fakenews2/api/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  static Future<RegisterResponse> register(
      String name, String email, String password,
      [String phone = '01010700700']) async {
    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      repassword: password,
      phone: phone,
    );
    var url = Uri.https(ApiConstants.baseurl, ApiConstants.register);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(
    String email,
    String password, [
    String name = 'Sara Hussine',
    String phone = '01010700700',
  ]) async {
    var requestBody = RegisterRequest(
      email: email,
      password: password,
      phone: phone,
      name: name,
      repassword: password,
    );
    var url = Uri.https(ApiConstants.baseurl, ApiConstants.login);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

class ApiConstants {
  static const baseurl = 'route-ecommerce.vercel.app';
  static const register = 'api/v1/auth/signup';
  static const login = 'api/v1/auth/signin';
}
