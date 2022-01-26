import 'package:flutter/material.dart';
import 'package:mymoney_app/components/date_picker.dart';
import 'package:mymoney_app/model/category.dart';
import 'package:mymoney_app/model/person.dart';

class RegisterDetailScreen extends StatefulWidget {
  const RegisterDetailScreen({Key? key}) : super(key: key);

  @override
  State<RegisterDetailScreen> createState() => _RegisterDetailScreenState();
}

class _RegisterDetailScreenState extends State<RegisterDetailScreen> {
  final List<Person> persons = [
    Person(
      code: "aa2310d7-e159-42f9-933c-c15048588d2b",
      name: "Alisson",
    ),
    Person(
      code: "d757fb84-fcd2-43d8-b2d8-9be5f756938b",
      name: "Cristina",
    )
  ];

  final List<Category> categories = [
    Category(
      code: "342fd092-ec78-4cc8-8fca-d04c34be56e2",
      name: "Lazer",
    ),
    Category(
      code: "2d78b3e2-2b61-4c45-9a75-eb79f7b6db81",
      name: "Alimentação",
    ),
    Category(
      code: "e45031d6-a3b3-4ef0-bc1f-0c3cb7e6fd22",
      name: "Supermercado",
    ),
    Category(
      code: "96cc0bbd-067e-4767-a128-1bac0ef1e074",
      name: "Farmácia",
    ),
    Category(
      code: "ee1f7943-8412-42c8-9c2c-711333464fab",
      name: "Outros",
    ),
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _formData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    Person? person =
        persons.firstWhere((p) => p.code == _formData['person']['code']);

    Category? category =
        categories.firstWhere((c) => c.code == _formData['category']['code']);

    return Scaffold(
      appBar: AppBar(
        title: Text(_formData['type'] == 'EXPENSE' ? "Despesa" : "Receita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _formData['description']?.toString(),
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                initialValue: _formData['value']?.toString(),
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              DropdownButtonFormField<Person>(
                decoration: const InputDecoration(labelText: "Pessoa"),
                value: person,
                elevation: 16,
                onChanged: (newValue) {
                  setState(() {
                    person = newValue!;
                  });
                },
                onSaved: (newValue) => _formData['person'] = person,
                items: persons.map((Person value) {
                  return DropdownMenuItem<Person>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<Category>(
                decoration: const InputDecoration(labelText: "Categoria"),
                value: category,
                elevation: 16,
                onChanged: (newValue) {
                  setState(() {
                    category = newValue!;
                  });
                },
                onSaved: (newValue) => _formData['category'] = category,
                items: categories.map((Category value) {
                  return DropdownMenuItem<Category>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
              DatePicker(
                withClearButton: false,
                text: 'Data de Vencimento',
                buttonText: 'Alterar Data de Vencimento',
                selectedDate: _formData['dueDate'],
                onDateChanged: (newDate) {
                  setState(() {
                    _formData['dueDate'] = newDate;
                  });
                },
              ),
              DatePicker(
                text: 'Data de Pagamento',
                buttonText: 'Alterar Data de Pagamento',
                selectedDate: _formData['paymentDate'],
                onDateChanged: (newDate) {
                  setState(() {
                    _formData['paymentDate'] = newDate;
                  });
                },
              ),
              TextFormField(
                initialValue: _formData['obs']?.toString(),
                decoration: const InputDecoration(labelText: 'Observações'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
