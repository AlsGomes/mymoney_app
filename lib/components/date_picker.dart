import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateChanged;
  final String text;
  final bool withClearButton;

  const DatePicker({
    Key? key,
    this.selectedDate,
    this.withClearButton = true,
    required this.onDateChanged,
    required this.text,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    ).then((value) {
      if (value == null) return;

      onDateChanged(value);
    });
  }

  _clearValue() {
    onDateChanged(null);
  }

  _buildActionButtons(BuildContext context) {
    var builder = [
      Expanded(
        child: Text(
          selectedDate == null
              ? "Não há $text"
              : "$text: \n${DateFormat("dd/MM/y").format(selectedDate!)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      IconButton(
        onPressed: () => _showDatePicker(context),
        icon: Icon(
          Icons.date_range_outlined,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ];

    if (withClearButton) {
      builder.add(
        IconButton(
          onPressed: () => _clearValue(),
          icon: const Icon(
            Icons.clear,
            size: 30.0,
            color: Colors.red,
          ),
        ),
      );
    }

    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2000),
              maximumDate: DateTime.now().add(const Duration(days: 365 * 5)),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: _buildActionButtons(context),
            ),
          );
  }
}
