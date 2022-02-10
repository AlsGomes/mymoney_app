import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoney_app/components/register_widget.dart';
import 'package:mymoney_app/model/category.dart';
import 'package:mymoney_app/model/person.dart';
import 'package:mymoney_app/model/register.dart';
import 'package:mymoney_app/routes/app_routes.dart';

class RegistersScreen extends StatelessWidget {
  static final registers = [
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

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisa de Registros"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () =>
            Navigator.of(context).pushNamed(AppRoutes.registerDetailScreen),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Descrição"),
              keyboardType: TextInputType.text,
              onSubmitted: (_) {},
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Vencimento"),
              keyboardType: TextInputType.text,
              onSubmitted: (_) {},
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Recebimento"),
              keyboardType: TextInputType.text,
              onSubmitted: (_) {},
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: registers.length,
                itemBuilder: (ctx, index) => RegisterWidget(
                  register: registers[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
