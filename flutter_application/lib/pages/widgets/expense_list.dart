import 'package:flutter_application/pages/widgets/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/pages/widgets/expense_item.dart';
import 'package:flutter_application/models/expense_model.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(this.expenses, this.onRemove, {Key? key}) : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    List<Expense> removedItem;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(expenses[index]),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      widget.onRemove(widget.expenses[index]);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
