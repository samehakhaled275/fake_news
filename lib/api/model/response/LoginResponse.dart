/// statusMsg : "fail"
/// message : "Incorrect email or password"
/// token : ""

class LoginResponse {
  LoginResponse({
    this.statusMsg,
    this.message,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    token = json['token'];
  }

  String? statusMsg;
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
