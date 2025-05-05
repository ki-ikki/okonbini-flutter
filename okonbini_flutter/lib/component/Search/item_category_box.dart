import 'package:flutter/material.dart';
import 'package:okonbini_flutter/model/item_category.dart';

Widget itemCategoryBox(ItemCategory itemCategory) {
  return SizedBox(
    width: double.infinity,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ItemCategory/${itemCategory.categoryName}.png',
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/ItemCategory/noimage.png',
                    width: 50,
                    height: 50,
                  );
                },
              ),
              const SizedBox(height: 8),
              Text(itemCategory.categoryLabel),
            ],
          ),
        ),
      ),
    ),
  );
}
