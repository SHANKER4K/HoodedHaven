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
import 'package:hoodedhaven/tools/myColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hooded Haven", style: GoogleFonts.inika(fontSize: 20.sp)),
          ],
        ),
        SizedBox(
          width: 352.w,
          height: 440.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 352,
                height: 398,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/homescreen.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Promotion(context),
                top: 367,
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 340.w,
          height: 195.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Store.promo.toList
                  .call()
                  .map(
                    (e) => Container(
                      width: 140.w,
                      height: 195.h,
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
                          setState(() {
                            !Store.Featured.contains(e)
                                ? Store.Featured.add(e)
                                : null;
                          });
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
        ),
        SizedBox(
          height: 10.h,
        ),
        Store.Featured.length != 0
            ? Text(
                "     Featured",
                style: TextStyle(fontSize: 20),
              )
            : Text(""),
        Store.Featured.length != 0 ? product_UI() : Text(""),
      ]),
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
                height: 100.h,
                width: 220.w,
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
        width: 175.w,
        height: 65.h,
        child: Center(
            child: Text(
          "Promotion",
          style: GoogleFonts.inika(fontSize: 29.sp),
        )));
  }
}

Expanded product_UI() {
  return Expanded(
    child: GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: Store.Featured.length,
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(36, 0, 34, 20),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 9 / 16,
      ),
      itemBuilder: ((context, index) {
        var filter = Store.Featured.where((element) {
          return element.title!.contains("hoodie");
        });
        return InkWell(
          child: ClipRRect(
            child: Card(
              color: myColors.secoundColor,
              shape: Border.all(color: Colors.black, width: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Store.Featured[index].imagepath.toString(),
                  ),
                  Container(
                    width: 80.w,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Column(
                      children: [
                        Text(
                          Store.Featured[index].title.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: GoogleFonts.inika(
                              fontWeight: FontWeight.bold, fontSize: 12.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Store.Featured[index].promoprice != null
                                  ? "\$" +
                                      Store.Featured[index].promoprice
                                          .toString()
                                  : "",
                              style: GoogleFonts.imprima(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp),
                            ),
                            Text(
                              "\$" + Store.Featured[index].price.toString(),
                              style: GoogleFonts.imprima(
                                  fontWeight: FontWeight.bold, fontSize: 25.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductPage(product: Store.Featured[index])));
          },
        );
      }),
    ),
  );
}
