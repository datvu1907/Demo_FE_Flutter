class FlightModel {
  String? id;
  String? title;
  String? description;
  String? image;
  int? price;
  String? date;

  FlightModel(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.price,
      this.date});

  FlightModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['date'] = date;
    return data;
  }
}
