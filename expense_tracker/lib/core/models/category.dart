import 'package:flutter/material.dart';

enum Category {
  travel,
  food,
  clothing;
}

extension CategoryIconResolver on Category {
  IconData getIcon() {
    return switch (this) {
      Category.travel => Icons.travel_explore,
      Category.food => Icons.food_bank,
      Category.clothing => Icons.warehouse
    };
  }
}
