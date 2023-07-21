class FocusModel {
  List<FoucsItemModel>? result;

  FocusModel({this.result});

  FocusModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <FoucsItemModel>[];
      json['result'].forEach((v) {
        result?.add(FoucsItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoucsItemModel {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  FoucsItemModel(
      {this.sId, this.title, this.status, this.pic, this.url, this.position});

  FoucsItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}
