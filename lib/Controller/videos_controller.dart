import 'package:news_app/Model/report_model.dart';
import 'package:news_app/Utils/base_controller.dart';

import '../Repository/home_repository.dart' as repo;

class VideosController extends BaseController {
  List<VideoModel> videos = <VideoModel>[];
  // int page = 0;
  int page = 0, totalPage = 0;
  int? totalCount;
  // Map data = <String,String>{};

  VideosController() {
    //
  }

  void getVideos(context) async {
    videos = <VideoModel>[];

    notifyListeners();

    repo.getVideos(context, page).then((value) {
      if (value != null) {
        if (value['result'] != null) {
          videos.addAll(List<VideoModel>.from(
              value['result'].map((item) => VideoModel.fromJson(item))));
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
        }
        // print(videos.length);
        notifyListeners();
      }
    });
  }
}
