

import 'package:dio/dio.dart';
import 'package:newroz_shop/models/base_model.dart';
import 'package:newroz_shop/models/categories_model.dart';
import 'package:newroz_shop/models/category_base_model.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://androidsupport.ir/pack/digiAndroid/')
abstract class RestClient {

  factory RestClient(Dio dio , {String baseUrl}) = _RestClient;

  @GET('home.php')
  Future<BaseModel> getHome();

  @GET('getCategories.php')
  Future<CatgeoryBaseModel> getCategories();


}