



import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {

  static String get bannerAdUnitId => Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' :
  'ca-app-pub-3940256099942544/6300978111';


  static BannerAd createbanner() {

    BannerAd ad = new BannerAd(size: AdSize.banner,
        adUnitId: bannerAdUnitId,
        listener: BannerAdListener(

          onAdClicked:(Ad ad) {
            print('onAdClicked');
          },
          onAdOpened: (Ad ad) {
            print('onAdClicked');
          },
          onAdClosed: (Ad ad) {
            print('onAdClosed');
          },
          onAdFailedToLoad: (Ad ad , LoadAdError ) {
            print('onAdFailedToLoad');
          },


        ), request: AdRequest());

    return ad;

  }
  
  
  static  interstialLoad(){

    InterstitialAd.load(adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(), adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad){
              ad.show();
            }, onAdFailedToLoad: (LoadAdError error){
              print('${error}');
        }));
    
  }

  static createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');

            ad.setImmersiveMode(true);
            ad.show(
                onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
                  print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
                });

          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
              createRewardedAd();

          },
        ));
  }



}