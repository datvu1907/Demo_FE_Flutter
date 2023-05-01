class OrderModel {
  String? id;
  String? flightId;
  String? userId;
  bool? isPaid;

  OrderModel({this.id, this.flightId, this.userId, this.isPaid});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightId = json['flightId'];
    userId = json['userId'];
    isPaid = json['isPaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['flightId'] = flightId;
    data['userId'] = userId;
    data['isPaid'] = isPaid;
    return data;
  }
}
