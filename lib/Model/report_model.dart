import 'package:intl/intl.dart';

class ReportModel {
  int? id;
  String? image;
  String? title;
  String? description;
  String? descriptionInString;
  String? descriptionInString1;
  String? postedDate;
  String? postedBy;
  int? categoryId;
  String? categoryName;
  String? slug;
  String? seoTitle;
  String? seoDesc;
  String? seoKeyword;
  int? viewCount;

  /////////////
  // int? id;
  // String? image;
  // String? title;
  // String? description;
  // String? postedDate;
  // String? postedBy;
  // int? categoryId;
  // String? categoryName;
  // String? slug;
  // String? seoTitle;
  // String? seoDesc;
  // String? seoKeyword;
  // int? viewCount;

  ReportModel();

  // String html = '<div><p>Hello</p>This is <br/>fluttercampus.com<span>,Bye!</span></div>';
//
// Bidi.stripThmlIfNeeded() method is from intl package
  // String parsedstring3 = Bidi.stripHtmlIfNeeded(html);
  // print(parsedstring3);

  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
//   String parsedstring1 = html.replaceAll(exp, '');
//   print(parsedstring1);
// //output without space:  HelloThis is fluttercampus.com,Bye!
//
//   String parsedstring2 = html.replaceAll(exp, ' ');
//   print(parsedstring2);

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['Image'];
    title = json['Title'];
    description = json['Description'] ?? '';
    // descriptionInString = Bidi.stripHtmlIfNeeded(description ?? '');
    descriptionInString1 = description!.replaceAll(exp, ' ');

    // postedDate = json['Posted_Date'];
    postedDate = json['Posted_Date'] != null
        ? DateFormat("MMM dd, yyyy")
            .format(DateTime.parse(json['Posted_Date']))
            .toString()
        : '';
    postedBy = json['Posted_By'];
    categoryId = json['CategoryId'];
    categoryName = json['Category_Name'];
    slug = json['slug'];
    seoTitle = json['seo_title'];
    seoDesc = json['seo_desc'];
    seoKeyword = json['seo_keyword'];
    viewCount = json['view_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Image'] = image;
    data['Title'] = title;
    data['Description'] = description;
    data['Posted_Date'] = postedDate;
    data['Posted_By'] = postedBy;
    data['CategoryId'] = categoryId;
    data['Category_Name'] = categoryName;
    data['slug'] = slug;
    data['seo_title'] = seoTitle;
    data['seo_desc'] = seoDesc;
    data['seo_keyword'] = seoKeyword;
    data['view_count'] = viewCount;
    return data;
  }
}

class VideoModel {
  int? id;
  String? videoName;
  String? videoPath;
  String? videoType;
  int? viewStatus;
  String? postedBy;
  String? postedOn;
  String? delStatus;

  VideoModel();
  // {
  // "id": 35,
  // "VideoName": "Covid19 ",
  // "VideoPath": "-Vq-FEeB4kg",
  // "VideoType": "Popular Video",
  // "Viewstatus": 1,
  // "Posted_By": null,
  // "posted_on": "2022-08-03T14:19:39.000Z",
  // "delStatus": "0"
  // }

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    videoName = json['VideoName'] ?? '';
    videoPath = json['VideoPath'] ?? '';
    videoType = json['VideoType'] ?? '';
    viewStatus = json['Viewstatus'] ?? 0;
    postedBy = json['Posted_By'] ?? '';
    postedOn = json['posted_on'] != null
        ? DateFormat("MMM dd, yyyy")
            .format(DateTime.parse(json['posted_on']))
            .toString()
        : '';
    delStatus = json['delStatus'] ?? '';
    // print(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['VideoName'] = videoName;
    data['VideoPath'] = videoPath;
    data['Posted_By'] = postedBy;
    data['posted_on'] = postedOn;
    return data;
  }
}

class PositionModel {
  List<ReportModel> positionLists = <ReportModel>[];

  PositionModel();

  PositionModel.fromJson(List<dynamic> json) {
    positionLists.addAll(
        List<ReportModel>.from(json.map((item) => ReportModel.fromJson(item))));
  }
}

class MagazineModel {
  int? id;
  String? magazineTitle;
  String? magazineDescription;
  String? magazineMonth;
  String? magazineYear;
  String? magazinePath;
  String? imagePath;
  int? status;
  String? delStatus;
  int? newMonth;

  MagazineModel();

  MagazineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    magazineTitle = json['MagazineTitle'] ?? '';
    magazineDescription = json['MagazineDescription'] ?? '';
    magazineMonth = json['MagazineMonth'] ?? '';
    magazineYear = json['MagazineYear'] ?? '';
    magazinePath = json['MagazinePath'] ?? '';
    imagePath = json['ImagePath'] ?? '';
    status = json['status'] ?? 0;
    delStatus = json['delStatus'] ?? '';
    newMonth = json['new_month'] ?? 0;
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['MagazineTitle'] = this.magazineTitle;
//   data['MagazineDescription'] = this.magazineDescription;
//   data['MagazineMonth'] = this.magazineMonth;
//   data['MagazineYear'] = this.magazineYear;
//   data['MagazinePath'] = this.magazinePath;
//   data['ImagePath'] = this.imagePath;
//   data['status'] = this.status;
//   data['delStatus'] = this.delStatus;
//   return data;
// }
}

// class Top {
//   int? id;
//   String? image;
//   String? title;
//   String? description;
//   String? postedDate;
//   String? postedBy;
//   int? categoryId;
//   String? categoryName;
//   String? slug;
//   String? seoTitle;
//   String? seoDesc;
//   String? seoKeyword;
//   int? viewCount;
//
//   Top();
//
//   Top.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['Image'];
//     title = json['Title'];
//     description = json['Description'];
//     postedDate = json['Posted_Date'];
//     postedBy = json['Posted_By'];
//     categoryId = json['CategoryId'];
//     categoryName = json['Category_Name'];
//     slug = json['slug'];
//     seoTitle = json['seo_title'];
//     seoDesc = json['seo_desc'];
//     seoKeyword = json['seo_keyword'];
//     viewCount = json['view_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['Image'] = image;
//     data['Title'] = title;
//     data['Description'] = description;
//     data['Posted_Date'] = postedDate;
//     data['Posted_By'] = postedBy;
//     data['CategoryId'] = categoryId;
//     data['Category_Name'] = categoryName;
//     data['slug'] = slug;
//     data['seo_title'] = seoTitle;
//     data['seo_desc'] = seoDesc;
//     data['seo_keyword'] = seoKeyword;
//     data['view_count'] =  viewCount;
//     return data;
//   }
// }
