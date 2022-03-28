

import 'package:flutter/material.dart';
import 'package:newroz_shop/pages/category/category_page.dart';
import 'package:newroz_shop/pages/home/home_page.dart';
import 'package:newroz_shop/pages/setting/setting_page.dart';

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
        title: Text('نوروز شاپ' , style: TextStyle(

          fontFamily: 'IRANSans'

        ),),
        centerTitle: true,

      ),
      body: Center(

        child: _widgetsList.elementAt(_currentItem),
      ) ,

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.blueAccent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _currentItem, // new
        onTap: onTabTapped,

        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'خانه'),
          BottomNavigationBarItem(icon: Icon(Icons.category) , label: 'دسته بندی'),
          BottomNavigationBarItem(icon: Icon(Icons.settings) , label: 'تنظیمات')

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
