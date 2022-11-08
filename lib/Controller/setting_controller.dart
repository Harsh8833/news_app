import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/Model/services_model.dart';
import 'package:news_app/Model/team_model.dart';
import 'package:news_app/Utils/base_controller.dart';

import '../Model/setting_models.dart';
import '../Repository/setting_repository.dart' as repo;
import '../Utils/common.dart';

class SettingController extends BaseController {
  List<TeamModel> teamList = <TeamModel>[];
  List<ServicesModel> servicesList = <ServicesModel>[];

  // int page = 1;

  // Map data = <String,String>{};

  ContactUsModel contactUs = ContactUsModel();

  SettingController() {
    //
  }

  void getTeamList(context) async {
    repo.getTeamList(context).then((value) {
      if (value != null) {
        if (value['result'] != null) {
          teamList.addAll(List<TeamModel>.from(
              value['result'].map((item) => TeamModel.fromJson(item))));
        }
        notifyListeners();
      }
    });
  }

  void getServicesList(context) async {
    repo.getServicesList(context).then((value) {
      if (value != null) {
        if (value['result'] != null) {
          servicesList.addAll(List<ServicesModel>.from(
              value['result'].map((item) => ServicesModel.fromJson(item))));
        }
        // print(servicesList.length);
        notifyListeners();
      }
    });
  }

  void createContactUs(context) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      loader = overlayLoader(context);
      formKey.currentState!.save();
      Overlay.of(context)!.insert(loader!);

      repo.createContactUs(context, contactUs).then((value) {
        if (value != null) {
          Fluttertoast.showToast(msg: value['message']);
        }
      }).whenComplete(() {
        removeLoader(loader!);
      });
    }
  }
}
