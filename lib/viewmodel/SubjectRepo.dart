import 'package:descend/viewmodel/IP.dart';
import 'package:get/get.dart';

//const $baseUrl = "http://10.254.3.98:3000";
//const $baseUrl = "http://172.16.1.160:3000";
const $baseUrl = baseIP;

class SubRepository extends GetConnect {
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


  Future<Response> searchSub(String name) async {
    Response response = await post(
        "/api/sub",
        {
          "name": name,
        }
    );
    print(response.statusCode);
    return response;
  }
}