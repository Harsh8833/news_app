import 'package:flutter/cupertino.dart';

ValueNotifier<User> currentUser = ValueNotifier(User());
ValueNotifier<UserInstruction> userInstruction =
    ValueNotifier(UserInstruction());

class User {
  String? id;
  String? apiKey;
  int? token;
  String? expiryTime;
  String? deviceToken;
  String? message;
  String? userName;
  String? password;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['user_id']?.toString() ?? '';
    apiKey = json['api_key'];
    token = json['token'];
    expiryTime = json['expiry_time'];
    deviceToken = json['device_token'];
    message = json['message'];
  }
}

class UserInstruction {
  int? id;
  int? userId;
  String? initialEntryTime;
  String? endOfDayEntryTime;
  int? status;
  String? createdAt;
  String? updatedAt;

  UserInstruction();

  UserInstruction.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    initialEntryTime = json['initial_entry_time'] ?? '';
    endOfDayEntryTime = json['end_of_day_entry_time'] ?? '';
    status = json['status'] ?? 0;
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }
}
