import 'package:flutter_application/pages/widgets/expenses.dart';
import 'package:flutter_application/pages/widgets/expense_item.dart';
import 'package:flutter_application/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(this.expenses, this.onRemove, this.onAdd, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  final void Function(Expense expense) onAdd;

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<Expense> removedItem = [];

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text("Alert!!",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color.fromARGB(255, 249, 2, 2),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          content: const Text("Expense is Deleted!",
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color.fromARGB(255, 249, 2, 2),
                fontSize: 20,
              )),
          actions: <Widget>[
            TextButton(
              child: const Text("OK",
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 249, 2, 2),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
                removedItem.removeAt(0);
              },
            ),
            TextButton(
              child: const Text("UNDO",
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 249, 2, 2),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                setState(() {
                  widget.onAdd(removedItem[0]);
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      removedItem.add(widget.expenses[index]);
                      widget.onRemove(widget.expenses[index]);

                      _showDialog(context);
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
