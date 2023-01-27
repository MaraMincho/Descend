
import 'package:get/get.dart';

import '../model/User.dart';

class UserViewModel extends GetxController {
  User currentUser = new User();
  void setUser(String token, String email, int id, String name) {
    currentUser.token = token;
    currentUser.email = email;
    currentUser.id = id;
    currentUser.name = name;
  }
}