class FeedModel {
  int? id;
  String? name;
  int? imageId;
  String? content;
  String? createAt;

  FeedModel({this.id, this.name, this.imageId, this.content, this.createAt});

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageId = json['imageId'];
    content = json['content'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageId'] = this.imageId;
    data['content'] = this.content;
    data['createAt'] = this.createAt;
    return data;
  }
}
