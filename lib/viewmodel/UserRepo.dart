import 'package:get/get.dart';

//const $baseUrl = "http://10.254.3.98:3000";
//const $baseUrl = "http://172.16.1.160:3000";
const $baseUrl = "http://127.0.0.1:3000";

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

  Future<int?> register(String name, String email, String password) async {
    Response response = await post(
        "/api/user/register",
        {
          "name": name,
          "email": email,
          "password": password
        }
    );
    print(response.statusCode);
    return response.statusCode;
  }

  Future<Response> login(String email, String password) async {
    Response response = await post(
        "/api/user/login",
        {
          "email": email,
          "password": password
        }
    );

    return response;
  }
}