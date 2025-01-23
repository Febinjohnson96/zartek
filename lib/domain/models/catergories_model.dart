import 'package:zartek/domain/models/dishes_model.dart';

class Categories {
  int? id;
  String? name;
  List<Dishes>? dishes;

  Categories({this.id, this.name, this.dishes});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (dishes != null) {
      data['dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
