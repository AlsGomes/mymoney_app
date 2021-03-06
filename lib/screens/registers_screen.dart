import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mymoney_app/components/register_widget.dart';
import 'package:mymoney_app/model/register_list.dart';
import 'package:provider/provider.dart';

class RegistersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterList>(context);
    final registers = provider.items;

    return Padding(
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
              itemBuilder: (ctx, index) {
                final _item = registers[index];

                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (ctx) => provider.removeItem(_item),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Excluir',
                      ),
                    ],
                  ),
                  child: RegisterWidget(
                    register: _item,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
