
import 'package:flutter/material.dart';
import 'package:newroz_shop/pages/admob_page/admob_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        
        child: Column(
          
          children: [
            
            Image.asset('assets/images/flutter_logo.jpeg'),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>AdmobPage()));


            }, child: Text('Ad'))

          ],
          
        ),
        
      ),

    );
  }
}
