import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoodedhaven/Screens/CartPage.dart';
import 'package:hoodedhaven/Screens/ProductPage.dart';
import 'package:hoodedhaven/tools/Products/Product.dart';
import 'package:hoodedhaven/tools/Products/Store.dart';
import 'package:hoodedhaven/tools/Profile.dart';
import 'package:hoodedhaven/tools/ResposiveSize.dart';
import 'package:provider/provider.dart';
import '../../tools/ResposiveSize.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Product> getfavorites() {
    return context.read<Profile>().favorites;
  }

  @override
  Widget build(BuildContext context) {
    void removeFromFavorite(Product product) {
      return context.read<Profile>().removeFromFavorite(product);
    }

    void addToCart(Product product) {
      return context.read<Store>().addToCart(product);
    }

    List<Product> favorites = getfavorites();
    return SafeArea(
      child: Scaffold(
          appBar: appBar(context),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return product_in_Favorite(
                    context, favorites, index, removeFromFavorite, addToCart);
              },
            ),
          )),
    );
  }

  GestureDetector product_in_Favorite(
      BuildContext context,
      List<Product> favorites,
      int index,
      void removeFromFavorite(Product product),
      void addToCart(Product product)) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(product: favorites[index])));
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                favorites.elementAt(index).imagepath.toString(),
                height: 100.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(favorites.elementAt(index).title.toString()),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "US \$" + favorites.elementAt(index).price.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      removeFromFavorite(favorites[index]);
                    });
                  },
                  color: Colors.grey[300],
                  child: Text("Cancel"),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      addToCart(favorites[index]);
                    });
                  },
                  color: Colors.red[400],
                  child: Text("Add to Cart"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      actions: [
        search(context),
      ],
    );
  }

  Padding search(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          showSearch(
              context: context,
              delegate: customSearch(favorites: getfavorites()));
        },
        child: Container(
          width: 280.w,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.search),
              SizedBox(width: 10),
              Text(
                "Serach ...",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customSearch extends SearchDelegate {
  List<Product> favorites = [];
  customSearch({required List<Product> favorites});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> Matched = [];
    for (var favorite in favorites) {
      if (favorite.title!.toLowerCase().contains(query)) {
        Matched.add(favorite);
      }
    }
    return ListView.builder(
        itemCount: Matched.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPage(product: favorites[index])));
            },
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      favorites.elementAt(index).imagepath.toString(),
                      height: 100.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(Matched.elementAt(index).title.toString()),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "US \$" +
                                  favorites.elementAt(index).price.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product>? Matched = [];
    for (var favorite in favorites) {
      if (favorite.title!.toLowerCase().contains(query)) {
        Matched.add(favorite);
      }
    }
    return ListView.builder(
        itemCount: Matched.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    favorites.elementAt(index).imagepath.toString(),
                    height: 100.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(favorites.elementAt(index).title.toString()),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "US \$" +
                                favorites.elementAt(index).price.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          );
        }));
  }
}
