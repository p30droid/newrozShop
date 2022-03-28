
import 'brands_model.dart';
import 'categories_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_base_model.g.dart';
@JsonSerializable()
class CatgeoryBaseModel {

  List<Categories>? categories;
  List<Brands>? brands;

  CatgeoryBaseModel({this.categories, this.brands});



  factory CatgeoryBaseModel.fromJson(Map<String, dynamic> json) => _$CatgeoryBaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatgeoryBaseModelToJson(this);

}