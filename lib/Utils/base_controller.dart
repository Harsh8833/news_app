import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Model/category_model.dart';
import 'package:news_app/Model/report_model.dart';

import '../Model/setting_models.dart';
import '../Repository/setting_repository.dart' as repo;

class BaseController extends ControllerMVC {
  OverlayEntry? loader;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController searchCon = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ///////////
  AboutUsModel aboutUs = AboutUsModel();
  ContactDetailsModel contactDetails = ContactDetailsModel();
  List<CategoryModel> categories = <CategoryModel>[];
  List<ReportModel> breakingList = <ReportModel>[];
  List<AdsModel> adsList = <AdsModel>[];

  List<MagazineModel> magazineYears = <MagazineModel>[];

  AdsModel? homeTop, homeBottom, homeGrid, home1, home2, home3;

  List<AdsModel> homeLastList = <AdsModel>[];

  // int page = 1, totalPage = 0;
  // int? totalCount;

  void getSettings(context) async {
    repo.getSettings(context).then((value) {
      if (value != null && value['result'] != null) {
        Map data = value['result'];
        if (data['category'] != null) {
          categories.addAll(List<CategoryModel>.from(
              data['category'].map((item) => CategoryModel.fromJson(item))));
        }
        if (data['about_us'] != null) {
          aboutUs = AboutUsModel.fromJson(data['about_us']);
        }
        if (data['contact_details'] != null) {
          contactDetails =
              ContactDetailsModel.fromJson(data['contact_details']);
        }
        if (data['breaking'] != null) {
          breakingList.addAll(List<ReportModel>.from(
              data['breaking'].map((item) => ReportModel.fromJson(item))));
        }
        if (data['ads'] != null) {
          adsList.addAll(List<AdsModel>.from(
              data['ads'].map((item) => AdsModel.fromJson(item))));
          setAdsImage();
        }
        notifyListeners();
      }
    });
  }

  MagazineModel? selectedMenu;

  void getMagazines(context) async {
    magazineYears = <MagazineModel>[];
    notifyListeners();
    repo.getMagazines(context, 0).then((value) {
      if (value != null && value['result'] != null) {
        magazineYears.addAll(List<MagazineModel>.from(
            value['result'].map((item) => MagazineModel.fromJson(item))));
        selectedMenu = magazineYears.first;

        notifyListeners();
      }
    });
  }

  setAdsImage() {
    for (AdsModel element in adsList) {
      if (element.position == "TOP") {
        homeTop = element;
      } else if (element.position == "BOTTOM") {
        homeBottom = element;
      } else if (element.position == "HOME GRID") {
        homeGrid = element;
      } else if (element.position == "HOME 1") {
        home1 = element;
      } else if (element.position == "HOME 2") {
        home2 = element;
      } else if (element.position == "HOME 3") {
        home3 = element;
      } else if (element.position == "RIGHT SIDE 1") {
        homeLastList.add(element);
      } else if (element.position == "RIGHT SIDE 2") {
        homeLastList.add(element);
      } else if (element.position == "RIGHT SIDE 3") {
        homeLastList.add(element);
      }
    }
    notifyListeners();
  }
}
