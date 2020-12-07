import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

String selectedCurrency = 'USD';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CupertinoPicker IOSCupertinoPicker() {
    List<Text> dropdownListItems = [];
    for (String currency in currenciesList) {
      dropdownListItems.add(Text('$currency'));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: dropdownListItems,
    );
  }

  DropdownButton<String> AndroidDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Text('$currency'),
          value: '$currency',
        ),
      );
    }
    return DropdownButton<String>(
        value: '$selectedCurrency',
        items: dropdownItems,
        onChanged: (value) {
          print(value);
          setState(() {
            selectedCurrency = value;
          });
        });
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return IOSCupertinoPicker();
    } else if (Platform.isAndroid) {
      return AndroidDropDownButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: AndroidDropDownButton(),
          ),
        ],
      ),
    );
  }
}
// DropdownButton(
// value: '$selectedCurrency',
// items: Dropdoownlist(),
// onChanged: (value) {
// print(value);
// setState(() {
// selectedCurrency = value;
// });
// }),
