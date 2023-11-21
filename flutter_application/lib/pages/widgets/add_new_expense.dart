import 'package:flutter/material.dart';
import 'package:flutter_application/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key, required this.onAdd}) : super(key: key);

  final void Function(Expense expense) onAdd;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Controller
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime date = DateTime.now();
  Category _selectedCategory = Category.Work;

  void _addNewExpense() {
    final amount = double.tryParse(_amountController.text);
    final name = _nameController.text;
    final selectedDate = date;
    final category = _selectedCategory;

    if (amount == null || amount < 0 || name.isEmpty || date == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.deepPurpleAccent, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(35.0),
              ),
              backgroundColor: Color.fromARGB(255, 12, 2, 100),
              title: const Text(
                "Validation Error",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Raleway'),
              ),
              content: const Text(
                "Please fill all blank areas.",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Raleway'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Okay",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Raleway')))
              ],
            );
          });
    } else {
      Expense addExpense = Expense(
          name: name, price: amount, date: selectedDate, category: category);
      widget.onAdd(addExpense);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(
                  label: Text("Expense Name",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color.fromARGB(255, 110, 110, 110)))),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text("Amount",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color.fromARGB(255, 110, 110, 110))),
                  prefixText: "₺"),
            ),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(date.month - 1),
                        lastDate: date,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.amberAccent, // <-- SEE HERE
                                onPrimary: Colors.redAccent, // <-- SEE HERE
                                onSurface: Colors.blueAccent, // <-- SEE HERE
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.red, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        });

                    if (newDate == null) return;
                    setState(() {
                      date = newDate;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_month)),
            const Text("Tarih Seçiniz..",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Color.fromARGB(255, 110, 110,
                        110))), // seçilen tarihi formatlayarak yazdırmak..
            const Spacer(),
            Row(
              children: [
                const Expanded(
                  child: Text('Kategori Seciniz:',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color.fromARGB(255, 110, 110, 110))),
                ),
                const Spacer(),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.greenAccent,
                    ),
                    dropdownColor: Colors.greenAccent,
                    value: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedCategory = value;
                      });
                    },
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString()));
                    }).toList(),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                _addNewExpense();
              },
              child: const Text(("Kaydet"),
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 255, 255, 255))),
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            ),
          ],
        ));
  }
}
