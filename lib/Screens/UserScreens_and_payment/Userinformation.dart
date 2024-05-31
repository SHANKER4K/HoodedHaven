import 'package:flutter/material.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Address.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Card.dart';

class Userinformation extends ChangeNotifier {
  String _username = "";
  String _mail = "";
  String _password = "";
  String _avatar = "";
  String _bio = "";
  PaymentCard? selectedCard;
  Address? selectedAddress;
  List addresses = [];
  List<PaymentCard> cards = [];
  void addAdress(String fullName, String streetname, String city,
      String postCode, String country, String phoneNumber) {
    addresses.add(Address(
        addressFullName: fullName,
        streetname: streetname,
        city: city,
        postCode: postCode,
        country: country,
        phoneNumber: phoneNumber));
    notifyListeners();
  }

  void addCard(String cardNumber, String cardName, String month, String year,
      String ccv) {
    cards.add(PaymentCard(
        cardNumber: cardNumber,
        cardName: cardName,
        month: month,
        year: year,
        ccv: ccv));
    notifyListeners();
  }

  void selectAddress(Address address) {
    selectedAddress = address;
  }

  void selectCard(PaymentCard card) {
    selectedCard = card;
  }
}
