import 'package:flutter_application/models/expense_model.dart';
import 'package:flutter/material.dart';

// 10:05
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 119, 236, 123),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: const Color.fromARGB(255, 110, 110, 110), width: 4),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.name,
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Color.fromARGB(255, 110, 110, 110))),
            Row(
              children: [
                Text("${expense.price.toStringAsFixed(2)} ₺",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color:
                            Color.fromARGB(255, 110, 110, 110))), // Alt GR + T
                const Spacer(),
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8),
                Text(expense.formattedDate,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color.fromARGB(255, 110, 110, 110)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
