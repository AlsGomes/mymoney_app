import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mymoney_app/components/date_picker.dart';
import 'package:mymoney_app/model/category.dart';
import 'package:mymoney_app/model/person.dart';
import 'package:mymoney_app/model/register.dart';

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

  var dueDateEdittingController = TextEditingController();
  var paymentDateEdittingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();

  _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();
    final register = Register(
      code: Random().nextDouble().toString(),
      description: _formData['description'],
      dueDate: DateFormat("dd/MM/yyyy").parse(_formData['dueDate']),
      paymentDate: _formData['paymentDate'] != ''
          ? DateFormat("dd/MM/yyyy").parse(_formData['paymentDate'])
          : null,
      obs: _formData['obs'],
      category: _formData['category'],
      person: _formData['person'],
      value: _formData['value'],
      type: switchControl[0] ? "INCOME" : "EXPENSE",
    );
  }

  _showDatePicker(BuildContext context, String property) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    _formData[property] = date;

    if (property == 'dueDate') {
      dueDateEdittingController.text =
          date != null ? DateFormat("dd/MM/yyy").format(date) : '';
    } else {
      paymentDateEdittingController.text =
          date != null ? DateFormat("dd/MM/yyy").format(date) : '';
    }
  }

  // _fillFormData(Register register) {
  //   _formData['type'] = register.type;
  //   _formData['description'] = register.description;
  //   _formData['value'] = register.value;
  //   _formData['dueDate'] = register.dueDate;
  //   _formData['paymentDate'] = register.paymentDate;
  //   _formData['obs'] = register.obs;
  //   _formData['person'] = register.person;
  //   _formData['category'] = register.category;

  //   dueDateEdittingController.text = _formData['dueDate']?.toIso8601String();
  // }
  var switchControl = [false];
  // bool switchControl = false;

  @override
  Widget build(BuildContext context) {
    // var arguments = ModalRoute.of(context)?.settings.arguments;

    // var register = arguments != null ? arguments as Register : null;
    // bool isEditting = false;
    // if (register != null) isEditting = true;
    // if (isEditting) _fillFormData(register!);

    // Person? person = register == null
    //     ? null
    //     : persons.firstWhere((p) => p.code == register.person.code);

    // Category? category = register == null
    //     ? null
    //     : categories.firstWhere((c) => c.code == register.category.code);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(
              Icons.save,
            ),
          )
        ],
        // title: Text(register != null && register.type == 'EXPENSE'
        //     ? "Despesa"
        //     : "Receita"),
        title: Text("Novo Registro"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(switchControl ? "Receita" : "Despesa"),
                //     Switch(
                //       onChanged: (value) {
                //         setState(() {
                //           print(value);
                //           switchControl = value;
                //         });
                //       },
                //       value: switchControl,
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    ToggleButtons(
                      children: <Widget>[
                        Icon(
                          switchControl[0]
                              ? Icons.attach_money
                              : Icons.money_off,
                          color: switchControl[0]
                              ? Colors.lightBlueAccent
                              : Colors.red,
                        ),
                      ],
                      isSelected: switchControl,
                      borderColor: switchControl[0]
                          ? Colors.lightBlueAccent
                          : Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onPressed: (int index) {
                        setState(() {
                          switchControl[index] = !switchControl[index];
                        });
                      },
                    ),
                    const SizedBox(width: 15),
                    Text(
                      switchControl[0] ? "RECEITA" : "DESPESA",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: _formData['description'],
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  textInputAction: TextInputAction.next,
                  onSaved: (_description) => {
                    _formData['description'] = _description ?? '',
                  },
                  validator: (_input) {
                    var input = _input ?? '';
                    input = input.trim();

                    if (input.isEmpty) return "Preenchimento obrigatório";
                    if (input.length < 5) {
                      return "Deve conter no mínimo 5 caracteres";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['value']?.toStringAsFixed(2),
                  decoration: const InputDecoration(labelText: 'Valor'),
                  textInputAction: TextInputAction.next,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onSaved: (_value) => {
                    _formData['value'] = double.parse(_value ?? '0'),
                  },
                  validator: (_inputString) {
                    var inputString = _inputString ?? '';
                    if (inputString.isEmpty) return "Preenchimento obrigatório";

                    final input = double.tryParse(inputString) ?? -1;

                    if (input < 0) {
                      return "Formato de número inválido. Utilize o padrão 0.00";
                    }

                    return null;
                  },
                ),
                DropdownButtonFormField<Person>(
                  decoration: const InputDecoration(labelText: "Pessoa"),
                  elevation: 16,
                  // value: person,
                  onChanged: (newValue) {
                    // setState(() {
                    //   person = newValue!;
                    // });
                  },
                  onSaved: (newValue) => _formData['person'] = newValue,
                  items: persons.map((Person value) {
                    return DropdownMenuItem<Person>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  validator: (_input) {
                    if (_input == null) return "Preenchimento obrigatório";
                  },
                ),
                DropdownButtonFormField<Category>(
                  decoration: const InputDecoration(labelText: "Categoria"),
                  elevation: 16,
                  // value: category,
                  onChanged: (newValue) {
                    //   setState(() {
                    //     category = newValue!;
                    //   });
                  },
                  onSaved: (newValue) => _formData['category'] = newValue,
                  items: categories.map((Category value) {
                    return DropdownMenuItem<Category>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  validator: (_input) {
                    if (_input == null) return "Preenchimento obrigatório";
                  },
                ),
                TextFormField(
                  readOnly: true,
                  controller: dueDateEdittingController,
                  decoration:
                      const InputDecoration(labelText: 'Data de Vencimento'),
                  onSaved: (dueDate) => _formData['dueDate'] = dueDate,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _showDatePicker(context, 'dueDate');
                  },
                  validator: (_input) {
                    var input = _input ?? '';
                    input = input.trim();

                    if (input.isEmpty) return "Preenchimento obrigatório";

                    return null;
                  },
                ),
                TextFormField(
                  readOnly: true,
                  controller: paymentDateEdittingController,
                  decoration:
                      const InputDecoration(labelText: 'Data de Pagamento'),
                  onSaved: (paymentDate) =>
                      _formData['paymentDate'] = paymentDate,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _showDatePicker(context, 'paymentDate');
                  },
                ),
                TextFormField(
                  initialValue: _formData['obs'],
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(labelText: 'Observações'),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (_obs) => {
                    _formData['obs'] = _obs ?? '',
                  },
                  validator: (_input) {
                    var input = _input ?? '';
                    input = input.trim();

                    if (input.isEmpty) return "Preenchimento obrigatório";
                    if (input.length < 5) {
                      return "Deve conter no mínimo 5 caracteres";
                    }

                    return null;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
