
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newroz_shop/pages/admob_page/admob_page.dart';
import 'package:newroz_shop/pages/setting/setting_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  //SettingController controller = Get.put(SettingController()) ;
 late SettingController controller  ;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.find<SettingController>() ;
  }

  @override
  Widget build(BuildContext context) {

    print('build is loaded');

    return Scaffold(

      body: Center(
        
        child: Column(
          
          children: [
            
            Image.asset('assets/images/flutter_logo.jpeg', height: 90,),

            ElevatedButton(onPressed: (){
            /*  Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>AdmobPage()));*/

             // Get.to(AdmobPage());

              Get.toNamed('/ad');
             // Get.offAndToNamed('/ad');

            }, child: Text('Ad')),

            ElevatedButton(
                style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  elevation: 8,
                  primary: Colors.pink,
                  textStyle: TextStyle(
                    fontFamily: 'IRANSans'
                  )
                )
                ,onPressed: (){
           ///  Get.snackbar('درباره نوروز شاپ', 'خوش آمدید به بهترین فروشگاه');

              Get.snackbar(
                "GeeksforGeeks",
                "Hello everyone",
                icon: Icon(Icons.person, color: Colors.white),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
              );


            }, child: Text('درباره ما')),



            ElevatedButton(onPressed: (){
              ///  Get.snackbar('درباره نوروز شاپ', 'خوش آمدید به بهترین فروشگاه');

             // Get.defaultDialog(title: 'تماس با فروشگاه' ,);


              Get.defaultDialog(
                  title: "GeeksforGeeks",
                  middleText: "Hello world!",
                  backgroundColor: Colors.green,
                  titleStyle: TextStyle(color: Colors.white),
                  middleTextStyle: TextStyle(color: Colors.white),
                  textConfirm: "Confirm",
                  textCancel: "Cancel",
                  cancelTextColor: Colors.white,
                  confirmTextColor: Colors.white,
                  buttonColor: Colors.red,
                  barrierDismissible: false,
                  radius: 50,
                  content: Column(
                    children: [
                      Container(child:Text("Hello 1")),
                      Container(child:Text("Hello 2")),
                      Container(child:Text("Hello 3")),
                    ],
                  )
              );

            }, child: Text('تماس با ما')),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ElevatedButton(onPressed: (){

                  Get.changeTheme(ThemeData.dark());

                }, child: Text('Dark Mode')),
                ElevatedButton(onPressed: (){

                  Get.changeTheme(ThemeData.light());
                }, child: Text('Light Mode')),

              ],

            ),

            ElevatedButton(onPressed: (){

              //GetUtils.

            }, child: Text('Utils')),

          Container(


            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ElevatedButton(onPressed: (){

                  controller.increment();

                }, child: Text('Inc')),
                Obx(()=> Text('result is ${controller.counter} ')),
                ElevatedButton(onPressed: (){

                  controller.decrement();

                }, child: Text('Dec')),


              ],

            ),
          ),


            Row(
              children: [

                ElevatedButton(onPressed: (){

                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);

                }, child: Text('English')),
                ElevatedButton(onPressed: (){

                  var locale = Locale('fa', 'IR');
                  Get.updateLocale(locale);

                }, child: Text('Farsi')),

              ],
            ),
            Row(

              children: [

                ElevatedButton(onPressed: () async{

                 final pref = await SharedPreferences.getInstance();

                 await pref.setInt("age", 20);

                 int? value = pref.getInt("age");
                 int counter = (pref.getInt('age') ?? 0) ;
                 print('$counter');
                 print('$value');

                }, child: Text('Save'))

              ],

            )

          ],
          
        ),


        
      ),

    );
  }
}
