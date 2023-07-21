class PcateModel {
  List<PcateItemModel>? result;

  PcateModel({this.result});

  PcateModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <PcateItemModel>[];
      json['result'].forEach((v) {
        result?.add(PcateItemModel.fromJson(v));
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

class PcateItemModel {
  String? sId;
  String? title;
  int? status;
  String? pic;
  String? pid;
  int? sort;
  int? goProduct;
  String? productId;

  PcateItemModel(
      {this.sId,
      this.title,
      this.status,
      this.pic,
      this.pid,
      this.sort,
      this.goProduct,
      this.productId});

  PcateItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['pid'] = pid;
    data['sort'] = sort;
    data['go_product'] = goProduct;
    data['product_id'] = productId;
    return data;
  }
}
