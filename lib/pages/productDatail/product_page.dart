import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:newroz_shop/customViews/persian_text.dart';
import 'package:newroz_shop/models/gallery_model.dart';
import 'package:newroz_shop/models/product_model.dart';
import 'package:newroz_shop/utils/my_color.dart';

class ProductPage extends StatefulWidget {

  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(

        child: Column(

          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  child: Row(

                    children: [

                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),

                    ],

                  ),

                ),
                Container(

                  child: IconButton(onPressed: () {

                    Navigator.of(context).pop();

                  }, icon: Icon(Icons.close)),

                ),


              ],
            ),
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.blue,
              autoPlayInterval: 3000,
              isLoop: true,
              indicatorBackgroundColor: Colors.grey,
              children: imageList(widget.product.gallery!),


            ),

            PersianTextView(
              title: widget.product.title, fontColor: Colors.black,
              fontSize: 14,),

            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )

          ],


        ),


      ),

    );
  }


  List<Widget> imageList(List<Gallery> galleryList) {
    List<Widget> widetsList = [];
    for (int i = 0; i < galleryList.length; i++) {
      widetsList.add(Image.network('${galleryList
          .elementAt(i)
          .img}'));
    }

    return widetsList;
  }

}
