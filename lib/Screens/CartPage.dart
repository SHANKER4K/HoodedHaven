import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoodedhaven/Screens/ProductPage.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/AddAddress.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/AddCard.dart';
import 'package:hoodedhaven/tools/Products/Store.dart';
import '../tools/ResposiveSize.dart';
import '../tools/myColor.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice() {
    return context.read<Store>().totalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(builder: (context, store, child) {
      var product = store.cart;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Cart",
                    style: GoogleFonts.jockeyOne(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              product_in_Card(product, store),
              payBar(context)
            ],
          ),
        ),
      );
    });
  }

  Expanded product_in_Card(List<dynamic> product, Store store) {
    return Expanded(
      child: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          final String imagepath = product[index].imagepath.toString();
          final String title = product[index].title.toString();
          final String price = product[index].price.toString();

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPage(product: product[index])));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170.h,
                width: 150.w,
                decoration: BoxDecoration(
                    color: myColors.secoundColor,
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagepath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //title
                              Text(
                                title,
                                style: GoogleFonts.jockeyOne(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              //sub(Size)
                              Text("Size " + product[index].size,
                                  style: GoogleFonts.jockeyOne(
                                      fontSize: 18.sp, color: Colors.grey)),
                              SizedBox(
                                height: 10.h,
                              ),
                              //price
                              Text(
                                "\$" + price,
                                style: GoogleFonts.imprima(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //minusbutton
                                IconButton(
                                    onPressed: () => setState(() =>
                                        product[index].quantity != 1
                                            ? product[index].quantity--
                                            : null),
                                    icon: Icon(Icons.remove)),
                                //quantity
                                Text(product[index].quantity.toString(),
                                    style:
                                        GoogleFonts.imprima(fontSize: 18.sp)),
                                //plusbutton
                                IconButton(
                                    onPressed: () {
                                      setState(() => product[index].quantity++);
                                    },
                                    icon: Icon(Icons.add)),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() =>
                                      store.removeFromCart(product[index]));
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ],
                    ),
                    //remove
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Center payBar(BuildContext context) {
    return Center(
      child: Container(
        width: 320.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: myColors.secoundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style: GoogleFonts.imprima(fontWeight: FontWeight.w100),
                  ),
                  Text(
                    "\$" + totalPrice().toString(),
                    style: GoogleFonts.imprima(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  totalPrice() != 0
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAddress(),
                          ),
                        )
                      : null;

                  //  Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AddCard(),
                  //   ),
                  // );
                },
                child: Text("Pay now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
