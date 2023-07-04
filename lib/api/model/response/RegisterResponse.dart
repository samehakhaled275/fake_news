import 'package:fakenews2/api/model/response/ServerErorr.dart';

import 'User.dart';

/// data : {"name":"Sara Hussine","email":"sarahussine@gmail.com","phone":"01010700700","password":"$2a$12$ZCx3EH15AkwKHkogm3Cwvey.DvPQNqe8MLGlkTdbbciDRNMHEWFwO","role":"user","_id":"649197fefc109813752568ef","createdAt":"2023-06-20T12:13:50.865Z","updatedAt":"2023-06-20T12:13:50.865Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0OTE5N2ZlZmMxMDk4MTM3NTI1NjhlZiIsImlhdCI6MTY4NzI2MzIzMiwiZXhwIjoxNjk1MDM5MjMyfQ.lvYnd-a4TKsrxqLYTBzAbZb99YdH2ANiV_OQaWDMD_8"

class RegisterResponse {
  RegisterResponse({
    this.user,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }

  User? user;
  String? token;
  List<ServerError>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }

  String mergeErrors() {
    String message = '';
    errors?.forEach((error) {
      message += '${error.msg ?? ""} \n';
    });
    return message;
  }
}
