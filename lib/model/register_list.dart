import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mymoney_app/model/category.dart';
import 'package:mymoney_app/model/person.dart';
import 'package:mymoney_app/model/register.dart';

class RegisterList with ChangeNotifier {
  List<Register> _items = [
    Register(
      code: "9ebcbdb2-b229-4e7f-aa92-5e9b81ea5f6f",
      description: "Salário mensal",
      dueDate: DateTime(2017, 06, 10),
      value: 6500.00,
      obs: "Distribuição de lucros",
      type: "INCOME",
      category: Category(
        code: "342fd092-ec78-4cc8-8fca-d04c34be56e2",
        name: "Lazer",
      ),
      person: Person(
        code: "aa2310d7-e159-42f9-933c-c15048588d2b",
        name: "Alisson",
      ),
    ),
    Register(
      code: "5b3728c6-4e37-439c-8094-06274269c077",
      description: "Bahamas",
      dueDate: DateTime(2017, 02, 10),
      paymentDate: DateTime(2017, 02, 10),
      value: 100.32,
      type: "EXPENSE",
      category: Category(
        code: "2d78b3e2-2b61-4c45-9a75-eb79f7b6db81",
        name: "Alimentação",
      ),
      person: Person(
        code: "d757fb84-fcd2-43d8-b2d8-9be5f756938b",
        name: "Cristina",
      ),
    ),
    Register(
      code: "ed8134b3-72dd-4356-8d33-7dd5a0d5afa6",
      description: "Top Club",
      dueDate: DateTime(2017, 06, 10),
      value: 120.00,
      type: "INCOME",
      category: Category(
        code: "e45031d6-a3b3-4ef0-bc1f-0c3cb7e6fd22",
        name: "Supermercado",
      ),
      person: Person(
        code: "aa2310d7-e159-42f9-933c-c15048588d2b",
        name: "Alisson",
      ),
    ),
    Register(
      code: "a59dc9d4-58dd-4472-a19a-d3365de65839",
      description: "CEMIG",
      dueDate: DateTime(2017, 02, 10),
      paymentDate: DateTime(2017, 02, 10),
      value: 110.44,
      obs: "Geração",
      type: "INCOME",
      category: Category(
        code: "e45031d6-a3b3-4ef0-bc1f-0c3cb7e6fd22",
        name: "Supermercado",
      ),
      person: Person(
        code: "d757fb84-fcd2-43d8-b2d8-9be5f756938b",
        name: "Cristina",
      ),
    ),
    Register(
      code: "12c67a61-8bfb-49a7-80b1-6b5b0ea49099",
      description: "DMAE",
      dueDate: DateTime(2017, 06, 10),
      value: 200.30,
      type: "EXPENSE",
      category: Category(
          code: "e45031d6-a3b3-4ef0-bc1f-0c3cb7e6fd22", name: "Supermercado"),
      person: Person(
        code: "d757fb84-fcd2-43d8-b2d8-9be5f756938b",
        name: "Cristina",
      ),
    ),
    Register(
      code: "0ac88bf6-0fa0-4b99-a1df-d6d436cc77c0",
      description: "Extra",
      dueDate: DateTime(2017, 03, 10),
      paymentDate: DateTime(2017, 03, 10),
      value: 1010.32,
      type: "INCOME",
      category: Category(
        code: "96cc0bbd-067e-4767-a128-1bac0ef1e074",
        name: "Farmácia",
      ),
      person: Person(
        code: "aa2310d7-e159-42f9-933c-c15048588d2b",
        name: "Alisson",
      ),
    )
  ];

  List<Register> get items => [..._items];

  void saveItemFromData(Map<String, dynamic> data) {
    bool hasId = data['code'] != null;

    final item = Register(
      code: hasId ? data['code'] : Random().nextDouble().toString(),
      description: data['description'],
      dueDate: DateFormat("dd/MM/yyyy").parse(data['dueDate']),
      paymentDate: data['paymentDate'] != ''
          ? DateFormat("dd/MM/yyyy").parse(data['paymentDate'])
          : null,
      obs: data['obs'],
      category: data['category'],
      person: data['person'],
      value: data['value'],
      type: data['type'],
    );

    if (hasId) {
      updateItem(item);
    } else {
      addItem(item);
    }
  }

  void addItem(Register item) {
    _items.add(item);
    notifyListeners();
  }

  void updateItem(Register item) {
    int index = _items.indexWhere((it) => it.code == item.code);
    if (index >= 0) {
      _items[index] = item;
      notifyListeners();
    }
  }

  void removeItem(Register item) {
    _items.remove(item);
    notifyListeners();
  }
}
