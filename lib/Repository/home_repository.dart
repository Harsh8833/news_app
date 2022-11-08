import '../Model/comment_model.dart';
import '../Utils/common.dart';
import '../Utils/sendRequest.dart';
import '../Utils/url_constants.dart';

Future getHomeData(context) async {
  final response = await getMethod(URLConstants.homeApiUrl);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getVideos(context, int page) async {
  final response =
      await getMethod(URLConstants.videosApiUrl + "?limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future gatArticlesByCategoryId(context, int categoryId, int page) async {
  final response = await getMethod(URLConstants.articlesByCategoryIdApiUrl +
      "$categoryId?limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future gatArticlesByCategorySlug(context, String slug, int page) async {
  final response = await getMethod(
      URLConstants.articlesByCategorySlugApiUrl + "$slug?limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future gatArticlesByKeyWord(context, String keyWord, int page) async {
  final response = await getMethod(
      URLConstants.articlesByKeyWordApiUrl + "$keyWord&limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getReportDetailsBySlug(context, String slug) async {
  final response = await getMethod(URLConstants.reportBySlugApiUrl +
      slug /*"kerosene-dealers-struggle-for-rehabilitation"*/);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getCommentsByArticleId(context, String id) async {
  final response = await getMethod(URLConstants.commentsByArticleIdApiUrl + id);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future visitorCount(context, String slug) async {
  final response =
      await getMethod(URLConstants.visitorCountApiUrl + slug + "?unique=yes");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getRecentPost(context) async {
  final response = await getMethod(URLConstants.recentPostApiUrl);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getAuthorByName(context, String name) async {
  final response = await getMethod(URLConstants.authorDetailsByNameApiUrl +
      name /*"npas---corporate-the-real-culprit"*/);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getCommentsByArticle(context, int articleId) async {
  final response = await getMethod(
      URLConstants.commentsByArticleApiUrl + articleId.toString());

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future createComment(CommentModel comment, int articleId, context) async {
  Map data = {
    'article_id': articleId.toString(),
    'name': comment.commentName ?? '',
    'email': comment.commentEmail ?? '',
    'message': comment.commentContent ?? ''
  };
  final response = await postMethod(
    url: URLConstants.createCommentApiUrl,
    data: data,
  );

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getMagazines(context, int? page) async {
  final response = await getMethod(
      URLConstants.digitalMagazineApiUrl + "?limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getDigitalMagazinesByYear(context, String? year, int? page) async {
  final response = await getMethod(
      URLConstants.digitalMagazineApiUrl + "?year=$year&limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}
