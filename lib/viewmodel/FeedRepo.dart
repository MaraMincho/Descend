import 'package:descend/viewmodel/IP.dart';
import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:get/get.dart';

const $baseUrl = baseIP;

class FeedRepo extends GetConnect {

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

  Future<Response> deleteBoard(int? id) async {
    Response response = await delete(
        "/api/feed/$id",
        headers: {"token" : "${userViewModel.currentUser.token}"},
    );
    return response;
  }

  Future<Response> updateBoard(int? feedid, String title, String content) async {
    print("피드아이디는?");
    print(feedid);
    Response response = await put(
        "/api/feed",
      headers: {"token" : "${userViewModel.currentUser.token}"},
      {
        "title" : "$title",
        "content" : "$content",
        "id" : feedid //feed고유 아이디
      }
    );
    return response;
  }


  Future<Response> createBoard(String? title, String? comment, int? sub_id, int? user_id) async {
    print(userViewModel.currentUser.token);
    print(sub_id);
    print(user_id);
    Response response = await post(
        "/api/feed",
        headers: {"token" : "${userViewModel.currentUser.token}"},
        {
          "user_id": user_id,
          "sub_id": 5,
          "title": title,
          "content": comment,
        }
    );
    return response;
  }

  Future<Response> createComment(int? userid, int? feedid, String? content) async {
    Response response = await post(
        "/api/comment",
        headers: {"token" : "${userViewModel.currentUser.token}"},
        {
          "user_id": userid,
          "feed_id": feedid,
          "content": content,
        }
    );
    return response;
  }


  Future<Response> getBoard(int? subid) async {
    Response response = await get(
        "/api/feed/$subid",
        headers: {"token" : "${userViewModel.currentUser.token}"},
    );
    return response;
  }

  Future<Response> getCommnet(int? feedid) async {
    Response response = await get(
      "/api/comment/$feedid",
      headers: {"token" : "${userViewModel.currentUser.token}"},
    );
    return response;
  }
}