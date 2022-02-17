import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoney_app/components/register_widget.dart';
import 'package:mymoney_app/model/register_list.dart';
import 'package:mymoney_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class RegistersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterList>(context);
    final registers = provider.items;

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
              decoration: InputDecoration(labelText: "Descrição"),
              keyboardType: TextInputType.text,
              onSubmitted: (_) {},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Vencimento"),
              keyboardType: TextInputType.text,
              onSubmitted: (_) {},
            ),
            TextField(
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
