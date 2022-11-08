class TeamModel {
  int? id;
  String? image;
  String? name;
  String? desc;
  String? facebook;
  String? twitter;
  String? google;
  String? linkdin;
  String? youtube;
  int? status;
  String? delstatus;

  TeamModel();

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    desc = json['desc'] ?? '';
    facebook = json['facebook'] ?? '';
    twitter = json['twitter'] ?? '';
    google = json['google'] ?? '';
    linkdin = json['linkdin'] ?? '';
    youtube = json['youtube'] ?? '';
    status = json['status'] ?? 0;
    delstatus = json['Delstatus'] ?? '';
  }
}

class AuthorModel {
  int? id;
  String? authorId;
  String? author;
  String? authorImage;
  int? viewStatus;
  String? delstatus;
  String? createDateTime;
  String? slug;
  String? desc;

  AuthorModel();

  AuthorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    authorId = json['Author_Id'] ?? '';
    author = json['Author'] ?? '';
    authorImage = json['AuthorImage'] ?? '';
    viewStatus = json['ViewStatus'] ?? 0;
    delstatus = json['Delstatus'] ?? '';
    createDateTime = json['CreateDateTime'] ?? '';
    slug = json['slug'] ?? '';
    desc = json['desc'] ?? '';
  }
}
