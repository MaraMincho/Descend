class Feed {
  int? id;
  int? userId;
  int? subId;
  String? title;
  String? content;
  String? updatedAt;
  String? createdAt;

  Feed(
      {this.id,
        this.userId,
        this.subId,
        this.title,
        this.content,
        this.updatedAt,
        this.createdAt});

  Feed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    subId = json['sub_id'];
    title = json['title'];
    content = json['content'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sub_id'] = this.subId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}