
import 'package:get/get.dart';

import '../model/User.dart';

class UserViewModel extends GetxController {
  User user = new User();
  void setUser(String token, String email, int id, String name) {
    user.token = token;
    user.email = email;
    user.id = id;
    user.name = name;
  }
}