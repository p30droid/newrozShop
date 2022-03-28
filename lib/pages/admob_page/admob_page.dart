

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:newroz_shop/utils/adbmob_service.dart';

class AdmobPage extends StatefulWidget {
  const AdmobPage({Key? key}) : super(key: key);

  @override
  _AdmobPageState createState() => _AdmobPageState();
}

class _AdmobPageState extends State<AdmobPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //AdMobService.interstialLoad();

    AdMobService.createRewardedAd();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Admob'),

      ),

      body: Center(

        child: Container(

          child: AdWidget(

            key: UniqueKey(),
            ad: AdMobService.createbanner()..load(),

          ),

        ),

      ),


    );
  }
}
