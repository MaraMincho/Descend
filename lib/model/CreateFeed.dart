class CreateFeed {
  int? subId;
  int? userId;
  String? title;
  String? content;

  CreateFeed({this.subId, this.userId, this.title, this.content});

  CreateFeed.fromJson(Map<String, dynamic> json) {
    subId = json['sub_id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_id'] = this.subId;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}