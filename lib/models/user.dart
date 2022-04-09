import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

/// id : 7
/// email : "michael.lawson@reqres.in"
/// first_name : "Michael"
/// last_name : "Lawson"
/// avatar : "https://reqres.in/img/faces/7-image.jpg"

@entity
class User extends Equatable{
  User({
      int? id, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? avatar,}){
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }
  @primaryKey
  int? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;
User copyWith({  int? id,
  String? email,
  String? firstName,
  String? lastName,
  String? avatar,
}) => User(  id: id ?? _id,
  email: email ?? _email,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  avatar: avatar ?? _avatar,
);
  int? get id => _id;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['avatar'] = _avatar;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}