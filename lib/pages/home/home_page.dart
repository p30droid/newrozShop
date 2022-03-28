import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:newroz_shop/api/rest_client.dart';
import 'package:newroz_shop/customViews/persian_text.dart';
import 'package:newroz_shop/models/base_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();

  late Future<BaseModel> getHome;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio();
    final client = RestClient(dio);
    getHome = client.getHome();

    print('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      SingleChildScrollView(

        child: FutureBuilder<BaseModel>(
          future: getHome,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                //height: MediaQuery.of(context).size.height-140,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('نمایش همه',
                              style: TextStyle(fontFamily: 'IRANSans')),
                          Text(
                            'برترین موبایل ها',
                            style: TextStyle(fontFamily: 'IRANSans'),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 200,
                      child:  ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.mobile?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index) {

                            return Container(
                              height: 200,
                              width: 120,
                              margin: EdgeInsets.all(8),
                              child: Card(

                                elevation: 8,

                                child: Container(

                                  height: 200,
                                  width: 120,

                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('${snapshot.data!.mobile![index].icon}',)

                                      )
                                  ),





                                ),

                              ),
                            );

                          }),
                    ),

                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('نمایش همه',
                              style: TextStyle(fontFamily: 'IRANSans')),
                          Text(
                            'آرایشی و بهداشتی',
                            style: TextStyle(fontFamily: 'IRANSans'),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 200,
                      child:  ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.makeup?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index) {

                            return Container(
                              height: 200,
                              width: 320,
                              margin: EdgeInsets.all(8),
                              child: Card(

                                elevation: 8,

                                child: Container(

                                  height: 200,
                                  width: 120,

                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage('${snapshot.data!.makeup![index].icon}',)

                                      )
                                  ),


                                  child: Center(


                                    child:

                                    Container(

                                      decoration: BoxDecoration(

                                          gradient: LinearGradient(

                                              colors: [

                                                Colors.amberAccent,
                                                Colors.red

                                              ]
                                          )
                                      ),

                                      child: Text(mySubstring('${snapshot.data!.makeup![index].title}') , style:  TextStyle(
                                          color: Colors.white , fontFamily: 'IRANSans'
                                      ),),
                                    ),
                                  ),





                                ),

                              ),
                            );

                          }),
                    ),

                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('نمایش همه',
                              style: TextStyle(fontFamily: 'IRANSans')),
                          Text(
                            'تخفیفان',
                            style: TextStyle(fontFamily: 'IRANSans'),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 200,
                      child:  ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.discount?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index) {

                            return Container(
                              height: 200,
                              width: 320,
                              margin: EdgeInsets.all(8),
                              child: Card(

                                elevation: 8,

                                child: Container(

                                  height: 200,
                                  width: 120,

                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage('${snapshot.data!.discount![index].icon}',)

                                      )
                                  ),


                                  child: Stack(

                                    children: [

                                      Positioned(

                                        bottom: 20,
                                         right: 20

                                         , child:    Container(

                                        decoration: BoxDecoration(

                                            gradient: LinearGradient(

                                                colors: [

                                                  Colors.green,
                                                  Colors.lightGreen

                                                ]
                                            )
                                        ),

                                        child: PersianTextView(
                                          title: mySubstring('${snapshot.data!.makeup![index].title}' ) ,fontSize: 18,
                                            fontColor: Colors.white,
                                        ),),
                                       ),

                                      Positioned(

                                        top: 20,
                                          left: 20,

                                          child:     Container(

                                            padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(

                                                colors: [

                                                  Colors.red,
                                                  Colors.red

                                                ]
                                            )
                                        ),

                                        child: Text(mySubstring('%${snapshot.data!.discount![index].discount}') , style:  TextStyle(
                                            color: Colors.white , fontFamily: 'IRANSans'
                                        ),),
                                      ))


                                    ],

                                  )





                                ),

                              ),
                            );

                          }),
                    ),

                  ],
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
              return CircularProgressIndicator();
            }
          },
        ),
      ),

    );
  }

  String mySubstring(String makeup){

    String text = makeup;
    print('$text and ${text.length}');
    if(makeup.length<=25){
      return makeup;
    }else {
      return makeup.substring(0,24);
    }

  }

}
