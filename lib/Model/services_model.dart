class ServicesModel {
  int? id;
  String? icon;
  String? title;
  String? desc;
  int? viewStatus;
  int? order;

  ServicesModel();

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    icon = json['icon'] ?? '';
    title = json['title'] ?? '';
    desc = json['desc'] ?? "";
    viewStatus = json['Viewstatus'] ?? 0;
    order = json['order'] ?? 0;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['icon'] = this.icon;
  //   data['title'] = this.title;
  //   data['desc'] = this.desc;
  //   data['Viewstatus'] = this.viewStatus;
  //   data['order'] = this.order;
  //   return data;
  // }
}
