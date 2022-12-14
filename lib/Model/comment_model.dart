class CommentModel {
  int? id;
  String? commentName;
  String? commentEmail;
  String? commentContent;
  String? created;

  CommentModel();

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    commentName = json['Comment_Name'] ?? '';
    commentEmail = json['Comment_Email'] ?? '';
    commentContent = json['Comment_Content'] ?? '';
    created = json['created'] ?? '';
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['Comment_Name'] = this.commentName;
//   data['Comment_Email'] = this.commentEmail;
//   data['Comment_Content'] = this.commentContent;
//   data['created'] = this.created;
//   return data;
// }
}

// class Autogenerated {
//   int? id;
//   String? commentName;
//   String? commentEmail;
//   String? commentContent;
//   Null? created;
//
//   Autogenerated(
//       {this.id,
//         this.commentName,
//         this.commentEmail,
//         this.commentContent,
//         this.created});
//
//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     commentName = json['Comment_Name'];
//     commentEmail = json['Comment_Email'];
//     commentContent = json['Comment_Content'];
//     created = json['created'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['Comment_Name'] = this.commentName;
//     data['Comment_Email'] = this.commentEmail;
//     data['Comment_Content'] = this.commentContent;
//     data['created'] = this.created;
//     return data;
//   }
// }
