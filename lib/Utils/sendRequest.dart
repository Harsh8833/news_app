import 'dart:convert';

import 'package:http/http.dart' as http;

// ValueNotifier<String> token = ValueNotifier('');

// Future postOnBoarding({required String url, required Map data}) async {
//   print('url ' + url);
//   print('Inputs ' + data.toString());
//
//   final client = http.Client();
//   final response = await client.post(Uri.parse(url), body: data);
//
//   print('Status Code ' + response.statusCode.toString());
//   print('Response ' + response.body);
//
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//     return data;
//   } else {
//     throw Exception(response.body);
//   }
// }

Future postMethod({required String url, var data}) async {
  print('url ' + url);
  print('Inputs ' + data.toString());
  // print(token.value);

  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    // headers: {'authorization': token.value.toString()},
    body: data,
  );

  print('Status Code ' + response.statusCode.toString());
  print('Response ' + response.body);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    return {
      'status': 'error',
      'message': 'Your token will be expired please logout and login again'
    };
  } else {
    throw Exception(response.body);
  }
}

// Future postDioRequestWithHeaders(String url, var body) async {
//   Response response;
//   print('URL ' + url);
//   print('Input ' + body.toString());
//   String data = jsonEncode(body);
//   // Map<String, dynamic> headers = Map<String, dynamic>();
//   // headers['authorization'] = "Bearer " + currentUser.value.token;
//   // headers['Content-Type'] = 'application/json';
//   // print('Header' + headers.toString());
//   try {
//     response = await Dio().post(url,
//         data: data,
//         options: Options(headers: {'authorization': token.value.toString()}));
//   } on DioError catch (e) {
//     print('Response' + e.response.data.toString());
//     return e.response.data;
//   }
//   print('Response' + response.data.toString());
//   return response.data;
// }

Future getMethod(String url) async {
  print('url ' + url);
  // print(token.value);

  final client = http.Client();

  final response = await client.get(
    Uri.parse(url),
    // headers: {
    //   'authorization': "Bearer " + currentUser.value.token!,
    //   // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOjE3MiwiR29vZ2xlSWQiOiIxMDc5MTc5MzY1ODMzNDk0MjIxMTYiLCJGYWNlYm9va0lkIjoiIiwiRmlyc3ROYW1lIjoiRmFzdCIsIkxhc3ROYW1lIjoibiBFYXN5IExlYXJuaW5nIiwiR2VuZGVyIjoiIiwiRW1haWwiOiJmYXN0bmVhc3lsZWFybmluZ0BnbWFpbC5jb20iLCJQaG90b1VybCI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FBVFhBSnpSMThTMmc3Slo4dTgwTTVNMWlnN19SWlBPQzRWSGdOVjVYUzlIPXM5Ni1jIiwiTWFwTG9jYXRpb24iOiIiLCJBcHRPckZsYXQiOiIiLCJMYW5kbWFyayI6IiIsIkxhdGl0dWRlIjoiMzkuOTE3ODAzMiIsIkxvbmdpdHVkZSI6Ii04Mi43MzQ3MTQyIiwiUmVmZXJyZXJDb2RlIjpudWxsLCJUb2tlblZlcnNpb24iOjEsIlVzZXJJZCI6MTcyLCJSb2xlSWQiOjIsIlZlcnNpb24iOjF9LCJpYXQiOjE2MzQ4NDEzNjgsImV4cCI6MTYzNTAxNDE2OH0.P6X8IGeDo2c70bD-cbNZgelk3FQFZ598TAiM5lgfPVI",
    //   // 'Content-Type': 'application/json'
    // },
  );

  print('Status Code ' + response.statusCode.toString());
  print('Response ' + response.body);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  /*else if (response.statusCode == 401) {
    return {
      'status': 'error',
      'message': 'Your token will be expired please logout and login again'
    };
  }*/
  else {
    throw Exception(response.body);
  }
}

// downloadFile() async {
//   // var headers = {
//   //   'authorization':
//   //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiI4OTgyNDkxMTcxIiwiaWF0IjoxNjM1Njc3MDU2LCJleHAiOjE2NjY2NzcwNTZ9.DAyP1gPjwBmDL7H0x5XJBxNVLOeUDMkt2tywV7eMdWs',
//   //   'Content-Type': 'application/x-www-form-urlencoded'
//   // };
//
//   var headers = {'authorization': token.value.toString()};
//
//   var request = http.Request(
//       'POST', Uri.parse('http://68.183.89.113:5000/app/generate-invoice'));
//   request.bodyFields = {'id': '61cd433b36fae06d5ce11fb1'};
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print('irshad');
//     // print(await response.stream.bytesToString());
//     print(await response.stream);
//     print(await response.stream.asBroadcastStream().elementAt(0));
//   } else {
//     print('irshad2');
//
//     print(response.reasonPhrase);
//   }
// }
