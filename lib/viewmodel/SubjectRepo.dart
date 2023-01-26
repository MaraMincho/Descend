import 'package:descend/viewmodel/IP.dart';
import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:get/get.dart';

//const $baseUrl = "http://10.254.3.98:3000";
//const $baseUrl = "http://172.16.1.160:3000";
const $baseUrl = baseIP;

class SubRepository extends GetConnect {

  var userViewModel = Get.put(UserViewModel());
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = baseIP;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }


  Future<Response> searchSub(String name) async {
    print(userViewModel.currentUser.token);
    Response response = await post(
        "/api/sub",
        headers: {"token" : "${userViewModel.currentUser.token}"},
        {
          "name": name,
        }
    );
    return response;
  }
}