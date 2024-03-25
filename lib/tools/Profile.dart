import 'package:flutter/material.dart';

import 'Products/Product.dart';

class Profile extends ChangeNotifier {
  Image? _image;
  String? _username;
  List<Product> _favorites = [];

  Image? get image => _image;

  set setImage(Image image) {
    this._image = image;
  }

  String? get username => _username;

  set setUsername(String username) {
    this._username = username;
  }

  List<Product> get favorites => _favorites;

  void addToFavorite(Product product) {
    bool isThesame = false;
    int index = 0;
    for (var i = 0; i < _favorites.length; i++) {
      isThesame = product.equals(_favorites[i]);
      if (isThesame) {
        index = i;
      }
    }
    if (isThesame == false) {
      _favorites.add(product);
    }
    notifyListeners();
  }

  void removeFromFavorite(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }
}
