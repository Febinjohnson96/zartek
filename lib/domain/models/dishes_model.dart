import 'package:zartek/domain/models/addons_model.dart';

class Dishes {
  int? id;
  String? name;
  String? price;
  String? currency;
  int? calories;
  String? description;
  List<Addons>? addons;
  String? imageUrl;
  bool? customizationsAvailable;

  Dishes(
      {this.id,
      this.name,
      this.price,
      this.currency,
      this.calories,
      this.description,
      this.addons,
      this.imageUrl,
      this.customizationsAvailable});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
    calories = json['calories'];
    description = json['description'];
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(Addons.fromJson(v));
      });
    }
    imageUrl = json['image_url'];
    customizationsAvailable = json['customizations_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['currency'] = currency;
    data['calories'] = calories;
    data['description'] = description;
    if (addons != null) {
      data['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    data['image_url'] = imageUrl;
    data['customizations_available'] = customizationsAvailable;
    return data;
  }
}
