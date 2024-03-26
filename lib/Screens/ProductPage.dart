import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoodedhaven/tools/Profile.dart';
import 'package:hoodedhaven/tools/myColor.dart';
import 'package:provider/provider.dart';
import '../tools/Products/Product.dart';
import '../tools/Products/Store.dart';

class ProductPage extends StatefulWidget {
  Product product;
  ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void addToCart(Product product) {
    context.read<Store>().addToCart(product);
  }

  void addToFavorite(Product product) {
    context.read<Profile>().addToFavorite(product);
  }

  void removeFromFavorite(Product product) {
    context.read<Profile>().removeFromFavorite(product);
  }

  List<Product> getfavorites() {
    return context.read<Profile>().favorites;
  }

  int _quantity = 1;
  List<bool> _sellections = List.generate(5, (_) => false);
  List<Text> _sizes = [
    Text("S"),
    Text("M"),
    Text("L"),
    Text("XL"),
    Text("XXL"),
  ];
  List<Color> colors = [
    Colors.black,
    Colors.yellow,
    Color.fromARGB(255, 89, 174, 243),
    Colors.brown,
    Colors.green,
  ];
  int _selectedcolor = 0;
  int _selectedsize = 0;
  int index = 0;
  bool _favorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 217, 217),
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  // Hooded Haven image
                  Hero(
                    tag: widget.product.imagepath.toString(),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage(widget.product.imagepath.toString()),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Products_info(),
                ],
              ),
            ),
            shoppingBar()
          ],
        ),
      ),
    );
  }













  Container shoppingBar() {
    return Container(
            height: 150,
            padding: EdgeInsets.all(15),
            color: myColors.secoundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" \$" + widget.product.price.toString(),
                        style: GoogleFonts.imprima(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        IconButton(
                            autofocus: true,
                            onPressed: () => setState(() {
                                  _quantity > 1 ? _quantity-- : null;
                                  widget.product.quantity = _quantity;
                                }),
                            icon: Icon(Icons.remove)),
                        //quantity
                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text(_quantity.toString(),
                                style: GoogleFonts.imprima(fontSize: 18)),
                          ),
                        ),
                        //plusbutton
                        IconButton(
                            autofocus: true,
                            onPressed: () {
                              setState(() {
                                _quantity++;
                                widget.product.quantity = _quantity;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
                AddToCart(),
              ],
            ),
          );
  }




















  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        favorite_add_and_remove(),
      ],
    );
  }

























  Padding favorite_add_and_remove() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: Icon(
            getfavorites().contains(widget.product)
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            color: Colors.pink.withOpacity(0.7),
          ),
          onPressed: () {
            setState(() {
              !getfavorites().contains(widget.product)
                  ? addToFavorite(widget.product)
                  : removeFromFavorite(widget.product);
            });
            //addToFavorite(widget.product);
          },
        ),
      ]),
    );
  }


















  Center AddToCart() {
    return Center(
      child: GestureDetector(
        onTap: () {
          addToCart(Product(
              title: widget.product.title,
              price: widget.product.price,
              imagepath: widget.product.imagepath,
              color: widget.product.color,
              quantity: widget.product.quantity,
              size: widget.product.size,
              promoprice: widget.product.promoprice));
        },
        child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Add to Cart",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }




























  Container Products_info() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.title.toString(),
              style: GoogleFonts.imprima(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                //promo price if exist
                Text(
                  widget.product.promoprice == null
                      ? ""
                      : " \$" + widget.product.promoprice.toString(),
                  style: GoogleFonts.imprima(
                      fontSize: 20, decoration: TextDecoration.lineThrough),
                ),
                // price
                Text(" \$" + widget.product.price.toString(),
                    style: GoogleFonts.imprima(
                      fontSize: 20,
                    )),
                // review
                SizedBox(width: 60),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
            SizedBox(height: 10),
            // size
            Text(
              "Size: ",
              style: GoogleFonts.imprima(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8.0, 0),
                  child: Wrap(
                    children: List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedsize = index;
                                  widget.product.size =
                                      _sizes[_selectedsize].data!;
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _selectedsize == index
                                            ? Colors.orange[200]
                                            : null,
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Center(
                                        child: _sizes
                                            .map((e) => Text(
                                                  e.data.toString(),
                                                  style: TextStyle(
                                                      color:
                                                          _selectedsize == index
                                                              ? Colors.white
                                                              : null),
                                                ))
                                            .elementAt(index)),
                                  )),
                            )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // color
            Text(
              "Color :",
              style: GoogleFonts.imprima(
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: List.generate(
                  5,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedcolor = index;
                            widget.product.color = colors[_selectedcolor];
                            print(widget.product.color);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: colors[index],
                            foregroundColor: Colors.black,
                            child: _selectedcolor == index
                                ? Icon(
                                    Icons.circle_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                : null,
                          ),
                        ),
                      )),
            ),
            SizedBox(height: 15),
            // description
            Text(
              "Description :",
              style: GoogleFonts.imprima(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Introducing our Gym Hoodie: the perfect blend of style and functionality for your workout. Crafted with premium fabric, it offers moisture-wicking technology for dryness and breathability. With a sleek design, relaxed fit, and convenient features like a drawstring hood and kangaroo pocket, it's your go-to for any activity. Elevate your workout wardrobe today."),
            ),
          ],
        ),
      ),
    );
  }
}
