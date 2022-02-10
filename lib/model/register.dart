import 'package:mymoney_app/model/category.dart';
import 'package:mymoney_app/model/person.dart';

class Register {
  final String code;
  final String description;
  final DateTime dueDate;
  DateTime? paymentDate;
  final double value;
  String? obs;
  final String type;
  final Category category;
  final Person person;

  Register({
    required this.code,
    required this.description,
    required this.dueDate,
    this.paymentDate,
    required this.value,
    this.obs,
    required this.type,
    required this.category,
    required this.person,
  });
}
