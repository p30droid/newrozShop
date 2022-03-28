import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newroz_shop/api/rest_client.dart';
import 'package:newroz_shop/models/categories_model.dart';
import 'package:newroz_shop/models/category_base_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<CatgeoryBaseModel> getCategories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio();

    final restClient = RestClient(dio);

    getCategories = restClient.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CatgeoryBaseModel>(
        future: getCategories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(

              height: MediaQuery.of(context).size.height - 140,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(

                crossAxisCount: 2,
                children: categoriesView(snapshot.data?.categories),
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('خطای ارتباط با سرور.مجددا امتحان کنید'),
                ElevatedButton(onPressed: () {}, child: Text('درخواست مجدد'))
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  List<Widget> categoriesView(List<Categories>? category) {
    List<Widget> _widgets = [];
    for (int i = 0; i < category!.length; i++) {
      _widgets.add(

         Card(
           elevation: 8,
           child:  Container(
             padding: EdgeInsets.all(5),
             height: 200,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                 image: DecorationImage(
                     fit: BoxFit.cover,
                     image: NetworkImage(
                       '${category[i].icon}',
                     ))),
           ),

         ));
    }
    return _widgets;
  }
}
