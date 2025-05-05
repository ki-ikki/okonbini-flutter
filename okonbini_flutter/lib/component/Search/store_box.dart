import 'package:flutter/material.dart';
import 'package:okonbini_flutter/model/store.dart';

Widget storeBox(Store store) {
  return Expanded(
    child: FractionallySizedBox(
      widthFactor: 1.0,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              'assets/StoreLogo/${store.storeName}.png',
              width: 80,
              height: 80,
            ),
          ),
        ),
      ),
    ),
  );
}
