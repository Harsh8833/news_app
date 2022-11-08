import 'package:news_app/Model/report_model.dart';
import 'package:news_app/Utils/base_controller.dart';

import '../Repository/home_repository.dart' as repo;

class HomeController extends BaseController {
  List<ReportModel> latest = <ReportModel>[];
  List<ReportModel> tops = <ReportModel>[];
  List<ReportModel> sliders = <ReportModel>[];
  List<MagazineModel> digitalMagazines = <MagazineModel>[];
  List<VideoModel> videos = <VideoModel>[];
  List<ReportModel> articlesList = <ReportModel>[];
  List<ReportModel> recentPostList = <ReportModel>[];
  List<PositionModel> positions = <PositionModel>[];

  int page = 0, totalPage = 0;
  int? totalCount;
  bool showError = false;

  // HomeController() {
  //   //
  // }

  void getHomeData(context) async {
    latest = <ReportModel>[];
    tops = <ReportModel>[];
    sliders = <ReportModel>[];
    digitalMagazines = <MagazineModel>[];
    videos = <VideoModel>[];

    notifyListeners();

    repo.getHomeData(context).then((value) {
      if (value != null && value['result'] != null) {
        Map data = value['result'];
        if (data['latest'] != null) {
          latest.addAll(List<ReportModel>.from(
              data['latest'].map((item) => ReportModel.fromJson(item))));
        }
        if (data['top'] != null) {
          tops.addAll(List<ReportModel>.from(
              data['top'].map((item) => ReportModel.fromJson(item))));
        }
        if (data['slider'] != null) {
          sliders.addAll(List<ReportModel>.from(
              data['slider'].map((item) => ReportModel.fromJson(item))));
        }
        if (data['digital_magazine'] != null) {
          digitalMagazines.addAll(List<MagazineModel>.from(
              data['digital_magazine']
                  .map((item) => MagazineModel.fromJson(item))));
        }
        if (data['videos'] != null) {
          videos.addAll(List<VideoModel>.from(
              data['videos'].map((item) => VideoModel.fromJson(item))));
        }
        if (data['articles'] != null && data['articles'].isNotEmpty) {
          data['articles'].forEach((key, value) {
            positions.add(PositionModel.fromJson(value));
          });
        }

        // print(positions.length);
        // print(latest.length);
        // print(tops.length);
        // print(sliders.length);
        // print(digitalMagazines.length);
        // print(videos.length);
        notifyListeners();
      }
    });
  }

  void gatArticlesByCategoryId(context, id, page) async {
    repo.gatArticlesByCategoryId(context, id, page).then((value) {
      if (value != null) {
        articlesList = <ReportModel>[];

        articlesList.addAll(List<ReportModel>.from(
            value['result'].map((item) => ReportModel.fromJson(item))));
        if (value['totalCount'] != null && value['totalCount'] > 0) {
          List<int> count = <int>[];
          totalCount = value['totalCount'] ?? 0;
          if (totalCount.toString().length == 1) {
            totalPage = 1;
          } else {
            for (int i = 0; i < totalCount.toString().length; i++) {
              count.add(int.parse(totalCount.toString().substring(i, i + 1)));
              // print(count);
            }
            count.removeLast();
            String list = '';
            for (var i = 0; i < count.length; i++) {
              list += count[i].toString();
            }
            totalPage = int.parse(list);
            totalPage++;
          }
          // listCount = (totalCount! / 10) as int?;
          // print(totalCount);
          // print(totalPage);
        }

        // print(articlesList.length);
        notifyListeners();
      }
    }).whenComplete(() {
      showError = true;
      notifyListeners();
    });
  }

  void gatArticlesByCategorySlug(context, slug, page) async {
    repo.gatArticlesByCategorySlug(context, slug, page).then((value) {
      if (value != null) {
        articlesList = <ReportModel>[];

        articlesList.addAll(List<ReportModel>.from(
            value['result'].map((item) => ReportModel.fromJson(item))));
        if (value['totalCount'] != null && value['totalCount'] > 0) {
          List<int> count = <int>[];
          totalCount = value['totalCount'] ?? 0;
          if (totalCount.toString().length == 1) {
            totalPage = 1;
          } else {
            for (int i = 0; i < totalCount.toString().length; i++) {
              count.add(int.parse(totalCount.toString().substring(i, i + 1)));
              // print(count);
            }
            count.removeLast();
            String list = '';
            for (var i = 0; i < count.length; i++) {
              list += count[i].toString();
            }
            totalPage = int.parse(list);
            totalPage++;
          }
          // listCount = (totalCount! / 10) as int?;
          // print(totalCount);
          // print(totalPage);
        }

        // print(articlesList.length);
        notifyListeners();
      }
    }).whenComplete(() {
      showError = true;
      notifyListeners();
    });
  }

  void gatArticlesByKeyWord(context, keyWord, page) async {
    repo.gatArticlesByKeyWord(context, keyWord, page).then((value) {
      if (value != null) {
        articlesList = <ReportModel>[];

        articlesList.addAll(List<ReportModel>.from(
            value['result'].map((item) => ReportModel.fromJson(item))));
        if (value['totalCount'] != null && value['totalCount'] > 0) {
          List<int> count = <int>[];
          totalCount = value['totalCount'] ?? 0;
          if (totalCount.toString().length == 1) {
            totalPage = 1;
          } else {
            for (int i = 0; i < totalCount.toString().length; i++) {
              count.add(int.parse(totalCount.toString().substring(i, i + 1)));
              // print(count);
            }
            count.removeLast();
            String list = '';
            for (var i = 0; i < count.length; i++) {
              list += count[i].toString();
            }
            totalPage = int.parse(list);
            totalPage++;
          }
          // listCount = (totalCount! / 10) as int?;
          // print(totalCount);
          // print(totalPage);
        }

        // print(articlesList.length);
        notifyListeners();
      }
    }).whenComplete(() {
      showError = true;
      notifyListeners();
    });
  }

  void getRecentPost(context) async {
    recentPostList = <ReportModel>[];
    notifyListeners();

    repo.getRecentPost(context).then((value) {
      if (value != null) {
        if (value['result'] != null) {
          recentPostList.addAll(List<ReportModel>.from(
              value['result'].map((item) => ReportModel.fromJson(item))));
        }

        // print(recentPostList.length);
        notifyListeners();
      }
    });
  }

  // List<MagazineModel> digitalMagazinesList = <MagazineModel>[];

  void getDigitalMagazines(context) async {
    digitalMagazines = <MagazineModel>[];
    notifyListeners();
    repo.getMagazines(context, page).then((value) {
      if (value != null && value['result'] != null) {
        digitalMagazines.addAll(List<MagazineModel>.from(
            value['result'].map((item) => MagazineModel.fromJson(item))));
        if (value['totalCount'] != null && value['totalCount'] > 0) {
          List<int> count = <int>[];
          totalCount = value['totalCount'] ?? 0;
          if (totalCount.toString().length == 1) {
            totalPage = 1;
          } else {
            for (int i = 0; i < totalCount.toString().length; i++) {
              count.add(int.parse(totalCount.toString().substring(i, i + 1)));
              // print(count);
            }
            count.removeLast();
            String list = '';
            for (var i = 0; i < count.length; i++) {
              list += count[i].toString();
            }
            totalPage = int.parse(list);
            totalPage++;
          }
          // listCount = (totalCount! / 10) as int?;
          // print(totalCount);
          // print(totalPage);
        }

        notifyListeners();
      }
    }).whenComplete(() {
      showError = true;
      notifyListeners();
    });
  }

  String? selectedYear;
  void getDigitalMagazinesByYear(context) async {
    digitalMagazines = <MagazineModel>[];
    notifyListeners();
    repo.getDigitalMagazinesByYear(context, selectedYear, page).then((value) {
      if (value != null && value['result'] != null) {
        digitalMagazines.addAll(List<MagazineModel>.from(
            value['result'].map((item) => MagazineModel.fromJson(item))));
        if (value['totalCount'] != null && value['totalCount'] > 0) {
          List<int> count = <int>[];
          totalCount = value['totalCount'] ?? 0;
          if (totalCount.toString().length == 1) {
            totalPage = 1;
          } else {
            for (int i = 0; i < totalCount.toString().length; i++) {
              count.add(int.parse(totalCount.toString().substring(i, i + 1)));
              // print(count);
            }
            count.removeLast();
            String list = '';
            for (var i = 0; i < count.length; i++) {
              list += count[i].toString();
            }
            totalPage = int.parse(list);
            totalPage++;
          }
          // listCount = (totalCount! / 10) as int?;
          // print(totalCount);
          // print(totalPage);
        }

        notifyListeners();
      }
    }).whenComplete(() {
      showError = true;
      notifyListeners();
    });
  }
}
