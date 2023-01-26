class User {
  String? email;
  int? id;
  String? token;
  String? name;

  User({this.email, this.id, this.token, this.name});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}
