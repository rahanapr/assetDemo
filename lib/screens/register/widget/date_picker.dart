
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickWidget extends StatefulWidget {
  const DatePickWidget({Key? key, required this.dateName}) : super(key: key);
  final String dateName;

  @override
  State<DatePickWidget> createState() => _DatePickWidgetState();
}

class _DatePickWidgetState extends State<DatePickWidget> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ssa');
    final String formatted = formatter.format(now);
    final format = DateFormat('dd-MM-yyyy');
    return DateTimeField(
        decoration: InputDecoration(
            icon: const Icon(Icons.calendar_month),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: widget.dateName),
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = showDatePicker(
              context: context,
              initialDate: currentValue ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(3100));
          // print(formatted);
          // print(date);
          return date;
        });
  }
}
