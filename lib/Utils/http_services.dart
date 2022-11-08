// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// import '../Model/user.dart';
//
// Future postDioRequest(String url, var body) async {
//   Response response;
//   print('URL ' + url);
//   print('Input ' + body.toString());
//   try {
//     response = await Dio().post(url, data: body);
//   } on DioError catch (e) {
//     print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   print('Response' + response.data.toString());
//   return response.data;
// }
//
// Future postDioRequestWithHeaders(String url, var body,
//     {String? header, int? isEncode}) async {
//   late Response response;
//   print('URL ' + url);
//   print('Input ' + body.toString());
//
//   String data = jsonEncode(body);
//   Map<String, dynamic> headers = <String, dynamic>{};
//   header != null
//       ? headers['GoogleAccessToken'] = header
//       : headers['authorization'] =
//           "Bearer " + currentUser.value.token!.toString();
//   headers['Content-Type'] = 'application/json';
//   print('Header' + headers.toString());
//   try {
//     response =
//         await Dio().post(url, data: data, options: Options(headers: headers));
//   } on DioError catch (e) {
//     print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   print('Response' + response.data.toString());
//   return response.data;
// }
//
// Future getDioRequest(String url) async {
//   Response response;
//
//   print('URL ' + url);
//   Map<String, dynamic> header = <String, dynamic>{};
//   // header['Authorization'] = "Bearer " + currentUser.value.token!.toString();
//   header['Content-Type'] = 'application/json';
//   print('Header' + header.toString());
//
//   try {
//     response = await Dio().get(
//       url, /*options: Options(headers: header)*/
//     );
//   } on DioError catch (e) {
//     print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   print('Response' + response.data.toString());
//   return response.data;
// }
//
// Future putDioRequest(String url, var body) async {
//   Response response;
//
//   print('URL ' + url);
//   print('Input ' + body.toString());
//   Map<String, dynamic> header = <String, dynamic>{};
//   header['Authorization'] = "Bearer " + currentUser.value.token!.toString();
//   header['Content-Type'] = 'application/json';
//   print('Header' + header.toString());
//   try {
//     response =
//         await Dio().put(url, data: body, options: Options(headers: header));
//   } on DioError catch (e) {
//     print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   print('Response' + response.data.toString());
//   return response.data;
// }
//
// Future delDioRequest(String url, var body) async {
//   Response response;
//
//   print('URL ' + url);
//   print('Input ' + body.toString());
//   Map<String, dynamic> header = <String, dynamic>{};
//   header['Authorization'] = "Bearer " + currentUser.value.token!.toString();
//   header['Content-Type'] = 'application/json';
//   print('Header' + header.toString());
//   try {
//     response =
//         await Dio().delete(url, data: body, options: Options(headers: header));
//   } on DioError catch (e) {
//     print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   print('Response' + response.data.toString());
//   return response.data;
// }
//
// // Future delDioRequest(String url, var body) async {
// //   Response response;
// //
// //   print('URL ' + url);
// //   print('Input ' + body.toString());
// //   try {
// //     response = await Dio().put(url, data: body);
// //   } on DioError catch (e) {
// //     print('Response' + e.response!.data.toString());
// //     return e.response!.data;
// //   }
// //   print('Response' + response.data.toString());
// //   return response;
// // }
//
// // ! Seller part
// Future postDioRequestWithAllOptional(String url,
//     {dynamic data,
//     Map<String, dynamic>? newHeaders,
//     String? header,
//     String? contentType}) async {
//   Response response;
//   Dio dio = Dio();
//   // print('URL ' + url);
//   // print('Input ' + data.toString());
//   Map<String, dynamic> headers = <String, dynamic>{};
//   header != null
//       ? headers['GoogleAccessToken'] = header
//       : headers['authorization'] =
//           "Bearer " + currentUser.value.token!.toString();
//   headers['Content-Type'] = contentType ?? 'application/json';
//   // print('Header' + headers.toString());
//   try {
//     response = await dio.post(url,
//         data: data, options: Options(headers: newHeaders ?? headers));
//   } on DioError catch (e) {
//     // print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   print('Response ' + response.data.toString());
//   print('Response ' + response.statusCode.toString());
//   return response.data;
// }
//
// Future putDioWithHeadersRequest(String url, var body, {String? header}) async {
//   Response response;
//   Map<String, dynamic> headers = <String, dynamic>{};
//   header != null
//       ? headers['GoogleAccessToken'] = header
//       : headers['authorization'] =
//           "Bearer " + currentUser.value.token!.toString();
//   headers['Content-Type'] = 'application/json';
//
//   // print('URL ' + url);
//   // print('Input ' + body.toString());
//   try {
//     response =
//         await Dio().put(url, data: body, options: Options(headers: headers));
//   } on DioError catch (e) {
//     // print('Response' + e.response!.statusCode.toString());
//     // print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   // print('Response' + response.statusCode.toString());
//   // print('Response' + response.data.toString());
//   return response.data;
// }
//
// Future patchDioWithHeadersRequest(String url, var body,
//     {String? header}) async {
//   Response response;
//   Map<String, dynamic> headers = <String, dynamic>{};
//   header != null
//       ? headers['GoogleAccessToken'] = header
//       : headers['authorization'] =
//           "Bearer " + currentUser.value.token!.toString();
//   headers['Content-Type'] = 'application/json';
//
//   // print('URL ' + url);
//   // print('Input ' + body.toString());
//   try {
//     response =
//         await Dio().patch(url, data: body, options: Options(headers: headers));
//   } on DioError catch (e) {
//     // print('Response' + e.response!.statusCode.toString());
//     // print('Response' + e.response!.data.toString());
//     return e.response!.data;
//   }
//   // print('Response' + response.statusCode.toString());
//   // print('Response' + response.data.toString());
//   return response.data;
// }
//
// Future downloadDioRequest(String url) async {
//   Response response;
//
//   Directory directory =
//       Directory('/storage/emulated/0/bitesVilla/Files/Media/');
//   if (!Directory(directory.path).existsSync()) {
//     Directory(directory.path).createSync(recursive: true);
//   }
//
//   try {
//     response = await Dio().download(url, directory.path + url.split('/').last);
//   } on DioError catch (e) {
//     print(e.response!.data.toString());
//     return null;
//   }
//   print(response.data.toString());
//   return response.data;
// }
//
// // Future<dynamic> getDishDataIrshad({int? sellerId}) async {
// //   // SharedHelper shared = SharedHelper();
// //   // var tokn = json.decode(await shared.getString('current_user'));
// //   Map<String, String> headers = {
// //     'Authorization': 'Bearer ' + currentUser.value.token!.toString(),
// //     'Content-Type': 'application/json',
// //   };
// //   // print('sellerId ' + sellerId.toString());
// //   Map<String, dynamic> data = {
// //     "sellerId": [
// //       200, 309, 311
// //       // sellerId
// //     ],
// //     "dishStatus": [7],
// //   };
// //
// //   try {
// //     Response res = await Dio().post(
// //         "http://bitesvilla-test.us-east-2.elasticbeanstalk.com/api/dish/sellerId",
// //         // URLConstants.selGetDishHome,
// //         data: json.encode(data),
// //         // data: data,
// //         options: Options(headers: headers));
// //
// //     print('status code  ${res.statusCode.toString()}');
// //     print('status headers ${res.headers} ');
// //     print('status data ${res.data['data'].length}');
// //     print('status datanType ${res.data['data'].runtimeType}');
// //
// //     var response = res.data as dynamic;
// //     if (res.statusCode == 200) {
// //       // print(response['data']);
// //       return res.data['data'];
// //     } else {
// //       return false;
// //     }
// //   } catch (e) {
// //     print('catech ${e.toString()}');
// //   }
// // }
