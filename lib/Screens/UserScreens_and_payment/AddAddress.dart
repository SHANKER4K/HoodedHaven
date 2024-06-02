import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/AddCard.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Address.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Userinformation.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Userinformation.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddressForm(),
      ),
    );
  }
}

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  List AddnewAddressList = [];
  Address? _selectedaddres;
  @override
  Widget build(BuildContext context) {
    return Consumer<Userinformation>(builder: (context, user, child) {
      void initState() {
        super.initState();
        if (user.addresses.isNotEmpty) {
          _selectedaddres = user.addresses.first;
        }
      }

      return user.addresses.isEmpty
          ? addnewAddress(user, context)
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropdownButton<Address>(
                      value: _selectedaddres,
                      hint: Text('Select a addres'),
                      onChanged: (Address? newValue) {
                        setState(() {
                          _selectedaddres = newValue;
                        });
                      },
                      items: user.addresses
                          .map<DropdownMenuItem<Address>>((address) {
                        return DropdownMenuItem<Address>(
                          value: address,
                          child: Text('${address.addressFullName}'),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            AddnewAddressList.add(addnewAddress(user, context));
                          });
                        },
                        child: AddnewAddressList.isEmpty
                            ? Text("Add addres")
                            : addnewAddress(user, context),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          user.selectedAddress = _selectedaddres;
                          Navigator.popAndPushNamed(context, "/addCard");
                        },
                        child: const Text("Next")))
              ],
            );
    });
  }

  Widget addnewAddress(Userinformation user, BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _streetAddressController,
              decoration: const InputDecoration(labelText: 'Street Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your street address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _postalCodeController,
              decoration: const InputDecoration(labelText: 'Postal Code'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your postal code';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _countryController,
              decoration: const InputDecoration(labelText: 'Country'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Save address
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Address saved')),
                  );
                  user.addAdress(
                      _fullNameController.text,
                      _streetAddressController.text,
                      _cityController.text,
                      _postalCodeController.text,
                      _postalCodeController.text,
                      _phoneNumberController.text);
                  AddnewAddressList.clear();
                  _formKey.currentState!.reset();
                }
              },
              child: Text('Save Address'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
