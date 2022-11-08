class AboutUsModel {
  String? content;
  String? heading;
  String? image;

  AboutUsModel();

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    content = json['content'] ?? '';
    heading = json['heading'] ?? '';
    image = json['image'] ?? '';
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['content'] = this.content;
//   data['heading'] = this.heading;
//   data['image'] = this.image;
//   return data;
// }
}

class AdsModel {
  String? position;
  String? file;
  String? link;

  AdsModel();

  AdsModel.fromJson(Map<String, dynamic> json) {
    position = json['position'] ?? '';
    file = json['file'] ?? '';
    link = json['link'] ?? '';
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['position'] = this.position;
//   data['file'] = this.file;
//   data['link'] = this.link;
//   return data;
// }
}

class ContactDetailsModel {
  String? email;
  String? phone;
  String? address;
  String? facebook;
  String? twitter;
  String? linkdin;
  String? google;
  String? youtube;

  ContactDetailsModel();

  ContactDetailsModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    address = json['address'] ?? '';
    facebook = json['facebook'] ?? '';
    twitter = json['twitter'] ?? '';
    linkdin = json['linkdin'] ?? '';
    google = json['google'] ?? '';
    youtube = json['youtube'] ?? '';
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['email'] = this.email;
//   data['phone'] = this.phone;
//   data['address'] = this.address;
//   data['facebook'] = this.facebook;
//   data['twitter'] = this.twitter;
//   data['linkdin'] = this.linkdin;
//   data['google'] = this.google;
//   data['youtube'] = this.youtube;
//   return data;
// }
}

class ContactUsModel {
  String? name;
  String? email;
  String? subject;
  String? message;
}
