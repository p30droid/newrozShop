import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:newroz_shop/pages/admob_page/admob_page.dart';
import 'package:newroz_shop/pages/category/category_page.dart';
import 'package:newroz_shop/pages/dashboard/dashboard_page.dart';
import 'package:newroz_shop/pages/home/home_page.dart';
import 'package:newroz_shop/pages/productDatail/product_page.dart';
import 'package:newroz_shop/pages/setting/setting_binding.dart';
import 'package:newroz_shop/pages/setting/setting_page.dart';
import 'package:newroz_shop/utils/message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp( GetMaterialApp(

    getPages: [

      GetPage(name: '/dashboard', page: ()=> DashboardPage(),
          binding: SettingBinding()),
      GetPage(name: '/home', page: ()=>HomePage()),
      GetPage(name: '/category', page: ()=>CategoryPage()),
      GetPage(name: '/setting', page: ()=>SettingPage() ,
          binding: SettingBinding()),
      GetPage(name: '/ad', page: ()=>AdmobPage()),
      GetPage(name: '/product', page: ()=>ProductPage())

    ],
    locale: Locale('fa', 'IR'),
    translations: Message(),
    initialRoute: '/dashboard',

    //home: DashboardPage(),

  ));
}
