import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  fontWeight: FontWeight.bold, fontSize: 28),
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
                  borderRadius: BorderRadius.circular(30),
                  child: Card(
                    color: const Color.fromARGB(255, 217, 217, 217),
                    shape: Border.all(
                        color: Colors.black,
                        width: ResponsiveSize.responsiveSize(context, 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                            Store.products[index].imagepath.toString()),
                        Container(
                          width: ResponsiveSize.responsiveSize(context, 100),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Column(
                            children: [
                              Text(
                                Store.products[index].title.toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: GoogleFonts.inika(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
                                        decoration:
                                            TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "\$" +
                                        Store.products[index].price
                                            .toString(),
                                    style: GoogleFonts.imprima(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
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
