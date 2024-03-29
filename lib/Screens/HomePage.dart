import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoodedhaven/Screens/ProductPage.dart';
import 'package:hoodedhaven/Screens/StorePage.dart';
import 'package:hoodedhaven/tools/Products/Product.dart';
import 'package:hoodedhaven/tools/Products/Store.dart';
import '../tools/ResposiveSize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hooded Haven", style: GoogleFonts.inika(fontSize: 20.sp)),
            ],
          ),
          SizedBox(
            width: ResponsiveSize.responsiveSize(context, 352),
            height: ResponsiveSize.responsiveSize(context, 440),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: ResponsiveSize.responsiveSize(context, 352),
                  height: ResponsiveSize.responsiveSize(context, 398),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/homescreen.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Promotion(context),
                  top: ResponsiveSize.responsiveSize(context, 367),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ResponsiveSize.responsiveSize(context, 5),
          ),
          Container(
            width: ResponsiveSize.responsiveSize(context, 340),
            height: ResponsiveSize.responsiveSize(context, 195),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Store.promo.toList
                    .call()
                    .map(
                      (e) => Container(
                        width: ResponsiveSize.responsiveSize(context, 140),
                        height: ResponsiveSize.responsiveSize(context, 195),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductPage(product: e)));
                          },
                          child: promo_product_info(e, context),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container promo_product_info(Product e, BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.hardEdge,
            child: DropShadowImage(
              blurRadius: 2.0, // Adjust blur radius
              offset: Offset(0.0, 0.0),
              image: Image.asset(
                e.imagepath.toString(),
                height: 100,
                width: 220,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            e.title.toString(),
            style:
                GoogleFonts.inika(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$" + e.promoprice.toString(),
                style: GoogleFonts.imprima(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
              Text("\$" + e.price.toString(),
                  style: GoogleFonts.imprima(
                      fontWeight: FontWeight.bold, fontSize: 20.sp)),
            ],
          )
        ],
      ),
    );
  }

  Container Promotion(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(212, 196, 184, 1),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(31)),
        width: ResponsiveSize.responsiveSize(context, 175),
        height: ResponsiveSize.responsiveSize(context, 65),
        child: Center(
            child: Text(
          "Promotion",
          style: GoogleFonts.inika(fontSize: 29.sp),
        )));
  }
}
