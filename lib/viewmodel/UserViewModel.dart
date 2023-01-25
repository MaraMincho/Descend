import 'package:descend/viewmodel/UserRepo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends GetxController {
  final userRepo = Get.put(UserRepository());

  String? token;

  Future<String?> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return (token !=null) ? token : null;
  }

  Future<bool> register(String name, String email, String password) async {
    String? token = await userRepo.register(name, email, password);

    if (token != null) {
      token = token;
      return true;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    String? token = await userRepo.login(email, password);

    if (token != null) {
      token = token;
      return true;
    }
    return false;
  }


}