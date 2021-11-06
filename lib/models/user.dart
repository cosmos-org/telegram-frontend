import 'image.dart';

class User {
  String id;
  String phonenumber;
  String username;
  Image? avatar;
  Image? cover_image;
  String? token;
  String password;

  User({
    required this.id,
    required this.phonenumber,
    required this.username,
    required this.password,
});

}