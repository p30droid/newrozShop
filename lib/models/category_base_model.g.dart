// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatgeoryBaseModel _$CatgeoryBaseModelFromJson(Map<String, dynamic> json) =>
    CatgeoryBaseModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => Brands.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatgeoryBaseModelToJson(CatgeoryBaseModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'brands': instance.brands,
    };
