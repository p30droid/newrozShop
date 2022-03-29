

import 'package:flutter/material.dart';
import 'package:newroz_shop/pages/category/category_page.dart';
import 'package:newroz_shop/pages/home/home_page.dart';
import 'package:newroz_shop/pages/setting/setting_page.dart';
import 'package:newroz_shop/utils/my_color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int _currentItem=0;

  List<Widget> _widgetsList=[

    HomePage(),
    CategoryPage(),
    SettingPage()

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: MyColor.app_color,
        title: Text('نوروز شاپ' , style: TextStyle(

          fontFamily: 'IRANSans'

        ),),
        centerTitle: true,

      ),
      body: SizedBox(

        child: _widgetsList.elementAt(_currentItem),
      ) ,

      bottomNavigationBar: SalomonBottomBar(

        selectedItemColor: Colors.white,
        currentIndex: _currentItem, // new
        onTap: onTabTapped,

        items: [

          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('home'.tr,style: TextStyle(

                fontFamily: 'IRANSans'

            )),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.category),
            title: Text('category'.tr,style: TextStyle(

                fontFamily: 'IRANSans'

            )),
            selectedColor: Colors.purple,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('setting'.tr,style: TextStyle(

                fontFamily: 'IRANSans'

            )),
            selectedColor: Colors.purple,
          ),

        ],


      ),

    );
  }

  onTabTapped(int index) {

    setState(() {
      this._currentItem = index;
    });

  }

}
