import 'package:get/get.dart';

const $baseUrl = "http://localhost:3000";

class UserRepository extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = $baseUrl;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<String?> register(String name, String email, String password) async {
    Response response = await post(
        "/api/user/register",
        {
          "name": name,
          "email": email,
          "password": password
        }
    );
    return (response.statusCode == 200) ? response.bodyString : null;
  }


  Future<String?> login(String email, String password) async {
    Response response = await post(
        "/api/user/register",
        {
          "email": email,
          "password": password
        }
    );
    return (response.statusCode == 200) ? response.bodyString : null;
  }
}