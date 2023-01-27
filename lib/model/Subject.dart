class Subject {
  int? id;
  String? subname;
  String? professor;
  String? subid;
  String? time;

  Subject({this.id, this.subname, this.professor, this.subid, this.time});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subname = json['subname'];
    professor = json['professor'];
    subid = json['subid'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subname'] = this.subname;
    data['professor'] = this.professor;
    data['subid'] = this.subid;
    data['time'] = this.time;
    return data;
  }
}
