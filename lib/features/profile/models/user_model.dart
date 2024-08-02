import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String avatar;
  bool active;
  String role;

  UserModel({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.avatar = '',
    this.active = false,
    this.role = '',
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    bool? active,
    String? role,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
        active: active ?? this.active,
        role: role ?? this.role,
      );

  factory UserModel.fromMap(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
        active: json["active"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "active": active,
        "role": role,
      };
}
