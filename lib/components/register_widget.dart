import 'package:flutter/material.dart';
import 'package:mymoney_app/routes/app_routes.dart';

class RegisterWidget extends StatelessWidget {
  final Map<String, dynamic> register;

  const RegisterWidget({
    Key? key,
    required this.register,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.registerDetailScreen,
        arguments: register,
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: register['type'] == 'EXPENSE'
              ? const Icon(
                  Icons.remove,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.add,
                  color: Colors.green,
                ),
          title: Text(register['description']),
          subtitle: Text(register['category']['name']),
          trailing: Text(
              double.parse(register["value"].toString()).toStringAsFixed(2)),
        ),
      ),
    );
  }
}
