// import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/builder.dart';

// part 'user_model.g.dart';

// @JsonSerializable()
class UserModel {
  late final int? uid;
  late final String? email;
  late final String? fullName;
  late final int? role;
  late final String? phoneNumber;
  late final String? token;

  UserModel({
    required this.uid,
    required this.role,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'id': uid,
        'nama': fullName,
        'role_id': role,
        'email': email,
        'no_hp': phoneNumber,
      },
      'token': token,
    };
  }

  UserModel.fromJson(Map json) {
    uid = json['user']['id'];
    fullName = json['user']['nama'];
    role = json['user']['role_id'];
    email = json['user']['email'];
    phoneNumber = json['user']['no_hp'];
    token = json['token'];
  }
}
