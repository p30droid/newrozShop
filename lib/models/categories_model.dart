

import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';
@JsonSerializable()
class Categories {


  String? id;
  String? title;
  String? description;
  String? icon;

  Categories({this.id, this.title, this.description, this.icon});


  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

}