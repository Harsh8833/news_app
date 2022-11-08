import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/Model/comment_model.dart';
import 'package:news_app/Model/report_model.dart';
import 'package:news_app/Model/team_model.dart';
import 'package:news_app/Utils/base_controller.dart';

import '../Repository/home_repository.dart' as repo;
import '../Utils/common.dart';

class ArticleDetailsController extends BaseController {
  ReportModel articleDetails = ReportModel();
  AuthorModel authorDetails = AuthorModel();
  List<MagazineModel> digitalMagazines = <MagazineModel>[];
  List<CommentModel> commentList = <CommentModel>[];
  CommentModel comment = CommentModel();
  String? prevSlug, nextSlug;

  // ArticleDetailsController() {
  //   //
  // }

  void getArticleDetailsBySlug(context, slug) async {
    repo.getReportDetailsBySlug(context, slug).then((value) {
      if (value != null) {
        articleDetails = ReportModel.fromJson(value['result']);
        getCommentsByArticleId(context, articleDetails.id.toString());
        getAuthorByName(context, articleDetails.postedBy);
        getCommentsByArticle(context, articleDetails.id);
        if (value['prev'] != null) {
          prevSlug = value['prev']['slug'] ?? "";
        }
        if (value['next'] != null) {
          nextSlug = value['next']['slug'] ?? '';
        }
        notifyListeners();
      }
    });
  }

  void getCommentsByArticleId(context, id) async {
    repo.getCommentsByArticleId(context, id).then((value) {
      if (value != null && value['result'] != null) {
        commentList = <CommentModel>[];
        commentList.addAll(List<CommentModel>.from(
            value['result'].map((item) => CommentModel.fromJson(item))));

        notifyListeners();
      }
    });
  }

  void visitorCount(context, slug) async {
    repo.visitorCount(context, slug).then((value) {
      if (value != null) {
        notifyListeners();
      }
    });
  }

  void getAuthorByName(context, name) async {
    repo.getAuthorByName(context, name).then((value) {
      if (value != null) {
        authorDetails = AuthorModel.fromJson(value['result']);
        notifyListeners();
      }
    });
  }

  List<CommentModel> comments = <CommentModel>[];

  void getCommentsByArticle(context, id) async {
    repo.getCommentsByArticle(context, id).then((value) {
      if (value != null) {
        comments.addAll(List<CommentModel>.from(
            value['result'].map((item) => CommentModel.fromJson(item))));

        notifyListeners();
      }
    });
  }

  List<ReportModel> recentPostList = <ReportModel>[];

  void getRecentPost(context) async {
    recentPostList = <ReportModel>[];
    notifyListeners();
    repo.getRecentPost(context).then((value) {
      if (value != null) {
        if (value['result'] != null) {
          recentPostList.addAll(List<ReportModel>.from(
              value['result'].map((item) => ReportModel.fromJson(item))));
        }
        notifyListeners();
      }
    });
  }

  void getDigitalMagazinesData(context) async {
    repo.getHomeData(context).then((value) {
      if (value != null && value['result'] != null) {
        Map data = value['result'];
        if (data['digital_magazine'] != null) {
          digitalMagazines = <MagazineModel>[];
          digitalMagazines.addAll(List<MagazineModel>.from(
              data['digital_magazine']
                  .map((item) => MagazineModel.fromJson(item))));
        }
        // print(digitalMagazines.length);
        notifyListeners();
      }
    });
  }

  void createComment(context, int id) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      loader = overlayLoader(context);
      formKey.currentState!.save();
      Overlay.of(context)!.insert(loader!);

      repo.createComment(comment, id, context).then((value) {
        if (value != null) {
          Fluttertoast.showToast(msg: value['message']);
        }
      }).whenComplete(() {
        removeLoader(loader!);
      });
    }
  }
}
