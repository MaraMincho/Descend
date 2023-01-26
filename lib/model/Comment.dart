class Comment {
  int? id;
  int? userId;
  String? content;
  String? updatedAt;
  String? createdAt;
  int? feedId;

  Comment(
      {this.id,
        this.userId,
        this.content,
        this.updatedAt,
        this.createdAt,
        this.feedId});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    content = json['content'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    feedId = json['feed_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['feed_id'] = this.feedId;
    return data;
  }
}
