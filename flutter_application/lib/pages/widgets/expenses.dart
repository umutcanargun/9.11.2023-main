import 'package:flutter/material.dart';
import 'package:flutter_application/models/expense_model.dart';

List<Expense> expenses = [
  Expense(
      name: "Ogle Yemegi",
      price: 200,
      date: DateTime.now(),
      category: Category.Food),
  Expense(
      name: "Flutter Udemy Course",
      price: 400,
      date: DateTime.now(),
      category: Category.Education),
  Expense(
      name: "Istanbul Kodluyor Bulusma",
      price: 600,
      date: DateTime.now(),
      category: Category.Travel),
  Expense(
      name: "Kitap - Defter",
      price: 800,
      date: DateTime.now(),
      category: Category.Work),
];
double totalFoodExpenditure() {
  double foodExpenditure = 0;
  for (int i = 0; i < (expenses.length); i++) {
    if (expenses[i].category == Category.Food) {
      foodExpenditure += expenses[i].price;
    }
  }
  return foodExpenditure;
}

double totalTravelExpenditure() {
  double travelExpenditure = 0;
  for (int i = 0; i < (expenses.length); i++) {
    if (expenses[i].category == Category.Travel) {
      travelExpenditure += expenses[i].price;
    }
  }
  return travelExpenditure;
}

double totalWorkExpenditure() {
  double workExpenditure = 0;
  for (int i = 0; i < (expenses.length); i++) {
    if (expenses[i].category == Category.Work) {
      workExpenditure += expenses[i].price;
    }
  }
  return workExpenditure;
}

double totalEducationExpenditure() {
  double educationExpenditure = 0;
  for (int i = 0; i < (expenses.length); i++) {
    if (expenses[i].category == Category.Education) {
      educationExpenditure += expenses[i].price;
    }
  }
  return educationExpenditure;
}

double totalExpenditure = totalEducationExpenditure() +
    totalWorkExpenditure() +
    totalTravelExpenditure() +
    totalFoodExpenditure();

class ChartData {
  ChartData(this.x, this.y, this.z);
  String x;
  double y;
  Color z;
}

final List<ChartData> chartData = [
  ChartData('Food', totalFoodExpenditure(), Color.fromARGB(255, 1, 1, 159)),
  ChartData(
      'Travel', totalTravelExpenditure(), Color.fromARGB(255, 50, 142, 245)),
  ChartData('Work', totalWorkExpenditure(), Color.fromARGB(255, 249, 64, 2)),
  ChartData('Education', totalEducationExpenditure(),
      Color.fromARGB(255, 252, 2, 252)),
  ChartData('Total', totalExpenditure, Color.fromARGB(255, 231, 87, 87)),
];
