import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoodedhaven/tools/myColor.dart';
import '../tools/Products/Store.dart';
import '../tools/ResposiveSize.dart';
import 'ProductPage.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Products",
              style: GoogleFonts.jockeyOne(
                  fontWeight: FontWeight.bold, fontSize: 28.sp),
            ),
          ),
          product_UI(),
        ],
      ),
    );
  }

  Expanded product_UI() {
    return Expanded(
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: Store.products.length,
        padding: const EdgeInsets.fromLTRB(36, 0, 34, 20),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 16,
        ),
        itemBuilder: ((context, index) {
          return InkWell(
            child: ClipRRect(
              child: Card(
                color: myColors.secoundColor,
                shape: Border.all(color: Colors.black, width: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Store.products[index].imagepath.toString()),
                    Container(
                      width: 100.w,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Column(
                        children: [
                          Text(
                            Store.products[index].title.toString(),
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
                                Store.products[index].promoprice != null
                                    ? "\$" +
                                        Store.products[index].promoprice
                                            .toString()
                                    : "",
                                style: GoogleFonts.imprima(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                              Text(
                                "\$" + Store.products[index].price.toString(),
                                style: GoogleFonts.imprima(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp),
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
                          ProductPage(product: Store.products[index])));
            },
          );
        }),
      ),
    );
  }
}
