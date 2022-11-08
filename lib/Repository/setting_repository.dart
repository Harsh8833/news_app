import '../Model/setting_models.dart';
import '../Utils/common.dart';
import '../Utils/sendRequest.dart';
import '../Utils/url_constants.dart';

Future getTeamList(context) async {
  final response = await getMethod(URLConstants.tealApiUrl);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getServicesList(context) async {
  final response = await getMethod(URLConstants.servicesApiUrl);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getSettings(context) async {
  final response = await getMethod(URLConstants.settingApiUrl);

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future getMagazines(context, int page) async {
  final response = await getMethod(
      URLConstants.digitalMagazineApiUrl + "?limit=10&page=$page");

  if (response != null && response['success'] == true) {
    return response;
  } else {
    if (response['data'] != null) snackBar(context, response['message'] ?? '');
    return null;
  }
}

Future createContactUs(context, ContactUsModel contactUs) async {
  Map data = {
    'name': contactUs.name ?? '',
    'email': contactUs.email ?? '',
    'message': contactUs.message ?? '',
    'subject': contactUs.subject ?? ''
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
