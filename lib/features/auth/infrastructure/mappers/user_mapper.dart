

import 'package:teslo_shop_mobile/features/auth/domain/domain.dart';

class UserMapper {

  static User userJsonEntity(  Map <String,dynamic> json) => User(
   id: json['id'],
   email: json['email'],
   fullName: json['fullName'],
   roles: List<String>.from(json['roles'].map( (role) => role)),
   token: json['token']
  );
}