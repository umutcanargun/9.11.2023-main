import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { Food, Education, Travel, Work }

const categoryIcons = {
  Category.Food: Icons.food_bank,
  Category.Education: Icons.cast_for_education,
  Category.Travel: Icons.car_rental,
  Category.Work: Icons.business
};

class Expense {
  Expense(
      {required this.name,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;

  String get formattedDate {
    var formatter = DateFormat.yMd();
    return formatter.format(date);
  }
}
