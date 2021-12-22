import 'package:flutter/material.dart';

class RegisterDetailScreen extends StatelessWidget {
  const RegisterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final register =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(register['type'] == 'EXPENSE' ? "Despesa" : "Receita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(register['description']),
            Text(register['obs'] ?? ""),
            Text(register['value'].toString()),
            Text(register['dueDate'].toString()),
            Text(register['paymentDate']?.toString() ?? ""),
            Text(register['person']['name']),
            Text(register['category']['name']),
          ],
        ),
      ),
    );
  }
}
