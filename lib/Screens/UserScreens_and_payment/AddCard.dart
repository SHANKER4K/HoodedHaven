import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Card.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Userinformation.dart';
import 'package:provider/provider.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardInfoForm(),
      ),
    );
  }
}

class CardInfoForm extends StatefulWidget {
  @override
  _CardInfoFormState createState() => _CardInfoFormState();
}

class _CardInfoFormState extends State<CardInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardnum = TextEditingController();
  final TextEditingController _cardName = TextEditingController();
  final TextEditingController _month = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  PaymentCard? _selectedCard;
  List AddPaymentCardList = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<Userinformation>(builder: (context, user, child) {
      void initState() {
        super.initState();
        if (user.cards.isNotEmpty) {
          _selectedCard = user.cards.first;
        }
      }

      return user.cards.isEmpty
          ? AddPaymentCard(user, context)
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropdownButton<PaymentCard>(
                      value: _selectedCard,
                      hint: Text('Select a card'),
                      onChanged: (PaymentCard? newValue) {
                        setState(() {
                          _selectedCard = newValue;
                        });
                      },
                      items:
                          user.cards.map<DropdownMenuItem<PaymentCard>>((card) {
                        return DropdownMenuItem<PaymentCard>(
                          value: card,
                          child: Text('${card.cardName} - ${card.cardNumber}'),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            AddPaymentCardList.add(
                                AddPaymentCard(user, context));
                          });
                        },
                        child: AddPaymentCardList.isEmpty
                            ? Text("Add Card")
                            : AddPaymentCard(user, context),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          user.selectedCard = _selectedCard;
                          Navigator.popAndPushNamed(context, "/validation");
                        },
                        child: Text("Next")))
              ],
            );
    });
  }

  Form AddPaymentCard(Userinformation user, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _cardnum,
                decoration: InputDecoration(labelText: 'Card Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Card number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cardName,
                decoration: InputDecoration(labelText: 'Card name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Card name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _month,
                      decoration: InputDecoration(labelText: 'Month'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the month';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: _year,
                      decoration: InputDecoration(labelText: 'year'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cvv,
                decoration: InputDecoration(labelText: 'CVV'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the CVV';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Use the provider to add the card
                      Provider.of<Userinformation>(context, listen: false)
                          .addCard(
                        _cardnum.text,
                        _cardName.text,
                        _month.text,
                        _year.text,
                        _cvv.text,
                      );
                    }
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Card saved')),
                      );
                    }
                    AddPaymentCardList.clear();
                    _formKey.currentState!.reset();
                  },
                  child: Text('Save Card'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
