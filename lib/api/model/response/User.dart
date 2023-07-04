/// name : "Sara Hussine"
/// email : "sarahussine@gmail.com"
/// phone : "01010700700"
/// password : "$2a$12$ZCx3EH15AkwKHkogm3Cwvey.DvPQNqe8MLGlkTdbbciDRNMHEWFwO"
/// role : "user"
/// _id : "649197fefc109813752568ef"
/// createdAt : "2023-06-20T12:13:50.865Z"
/// updatedAt : "2023-06-20T12:13:50.865Z"
/// __v : 0

class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.id,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
  }

  String? name;
  String? email;
  String? phone;
  String? password;
  String? id;

  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? id,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;
    return map;
  }
}
