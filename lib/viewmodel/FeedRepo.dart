import 'package:descend/viewmodel/UserRepo.dart';
import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:get/get.dart';


class FeedRepository extends GetConnect {
  final userController = Get.put(UserViewModel());

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = $baseUrl;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    // TODO: implement onInit

    super.onInit();
  }

  //
  // Future<List?> feedIndex() async {
  //   String? token = await userController.getToken();
  //   if (token == null) return null;
  //   Response response = await get(
  //     '/api/feed',
  //     headers: {'token' : token}
  //   );
  //   if (response.statusCode == 401) {
  //     return null;
  //   }
  //   return response.body;
  // }


}